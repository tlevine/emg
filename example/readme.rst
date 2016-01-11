Software
^^^^^^^^^^^^^^^^^^
The Cymatic LR-16 produces a directory of wav files named
``Track 1.wav``, ``Track 2.wav``, and so on, until ``Track 16.wav``.

I record the trigger track, and I use the rest for
EMG sensors. I specify what the connections are with a table
like this one, which the processing software reads.

.. csv-table::

    track,label
    1,trigger
    2,microphone
    3,extensor.digitorum
    4,extensor.indicis
    5,extensor.digiti.minimi
    6,flexor.digitorum.superficialis
    7,flexor.digitorum.profundus

The result of the processing should be a table of a schema like this
(not necessarily in SQL).

::

    CREATE TABLE trial (
        number INTEGER NOT NULL,
        crack_frame INTEGER NOT NULL,
        audible BOOLEAN NOT NULL,
        UNIQUE(number)
    );
    CREATE TABLE track (
        trial_number 
        muscle TEXT NOT NULL, -- Or ENUM
        rms1 FLOAT NOT NULL,
        rms2 FLOAT NOT NULL,
        rms3 FLOAT NOT NULL,
        UNIQUE(trial_number, muscle)
    );

The trial table might look like this.

.. csv-table::

    number, crack.frame, audible
    1,      82,          TRUE
    2,      73,          FALSE
    3,      95,          TRUE
    4,      28,          FALSE

The track table might look like this.

.. csv-table::

    trial_number, muscle,         rms.1,   rms.2,  rms.3
    1,extensor.digitorum,         0.25024, 0.9824, 0.1630
    1,flexor.digitorum.profundus, 0.49324, 0.5784, 0.3973

I'll probably write the software in Python, but if I were to do it in R,
it will probably do something like this.

::

    rms <- sd # not exactly, but whatever
    paired.rms <- function(column, crack.frame) {
      i <- 1:crack.frame
      c(before = rms(column[i]),
        after = rms(column[-i]))
    }

Trigger track
^^^^^^^^^^^^^^^^^
Well, first, she said to turn on a light at a particular time rather
than synchronizing in video. Even easier, turn on a sound.
Did she call this a "trigger"? Well I'm gonna call it that for now.

Record the following audio track.

Second 0
    The track starts, and a tone is played. Let's say C4.
    Then a voice announces either "Audible click" or "No click".
Second 3
    Another tone is played, at a major third up from the
    first tone. So E4. In response, the participant prepares his wrist
    to make the click or non-click.
Second 6
    The fifth interval from the first note is played, so G4.
    In response, the participant makes the click or the non-click.
Second 9
    An arpeggio of the three tones plus the octave of the
    base note (C4-E4-G4-C5) is played to signal the end of the trial.
