  function [data, auxData, metaData, txtData, weights] = mydata_Sander_canadensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Sander_canadensis'; 
metaData.species_en = 'Sauger'; 

metaData.ecoCode.climate = {'Cfa','Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 26]; 

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 32;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase'; 
data.Li = 76;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'JohnLysa2012';
  comment.Wwb = 'based on egg dry weight 0.6 mg';
data.Wwp = 298.6;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 4e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';

% univariate data

% time-length
data.tL_Gf = [ ... % time since birth (yr), total length (inch)
    1  5.0
    2  8.8
    3 12.5
    4 15.7
    5 18.4
    6 23.1];
data.tL_Gf(:,1) = 365 * (-0.2 + data.tL_Gf(:,1));  % convert yr to d
data.tL_Gf(:,2) = 2.54 * data.tL_Gf(:,2);  % convert inch to cm
units.tL_Gf = {'d', 'cm'}; label.tL_Gf = {'time since birth', 'total length', 'female'};  
temp.tL_Gf = C2K(16);  units.temp.tL_Gf = 'K'; label.temp.tL_Gf = 'temperature';
bibkey.tL_Gf = 'Caru1963';
comment.tL_Gf = 'Data for females from Garrison Reservoir';
%
data.tL_Gm = [ ... % time since birth (yr), total length (inch)
    1  4.8
    2  8.5
    3 11.5
    4 14.1
    5 17.6];
data.tL_Gm(:,1) = 365 * (-0.2 + data.tL_Gm(:,1));  % convert yr to d
data.tL_Gm(:,2) = 2.54 * data.tL_Gm(:,2);  % convert inch to cm
units.tL_Gm = {'d', 'cm'}; label.tL_Gm = {'time since birth', 'total length', 'male'};  
temp.tL_Gm = C2K(16);  units.temp.tL_Gm = 'K'; label.temp.tL_Gm = 'temperature';
bibkey.tL_Gm = 'Caru1963';
comment.tL_Gm = 'Data for males from Garrison Reservoir';
%
data.tL_tf = [ ... % time since birth (yr), total length (inch)
    1  4.8
    2  8.5
    3 11.4
    4 13.9
    5 16.3
    6 18.7
    7 20.6
    8 25.6];
data.tL_tf(:,1) = 365 * (-0.2 + data.tL_tf(:,1));  % convert yr to d
data.tL_tf(:,2) = 2.54 * data.tL_tf(:,2);  % convert inch to cm
units.tL_tf = {'d', 'cm'}; label.tL_tf = {'time since birth', 'total length', 'female'};  
temp.tL_tf = C2K(16);  units.temp.tL_tf = 'K'; label.temp.tL_tf = 'temperature';
bibkey.tL_tf = 'Caru1963';
comment.tL_tf = 'Data for females from tailrace';
%
data.tL_tm = [ ... % time since birth (yr), total length (inch)
    1  4.6
    2  8.4
    3 11.2
    4 13.3
    5 15.3
    6 18.0];
data.tL_tm(:,1) = 365 * (-0.2 + data.tL_tm(:,1));  % convert yr to d
data.tL_tm(:,2) = 2.54 * data.tL_tm(:,2);  % convert inch to cm
units.tL_tm = {'d', 'cm'}; label.tL_tm = {'time since birth', 'total length', 'male'};  
temp.tL_tm = C2K(16);  units.temp.tL_tm = 'K'; label.temp.tL_tm = 'temperature';
bibkey.tL_tm = 'Caru1963';
comment.tL_tm = 'Data for males from tailrace';

% length - fecundity
data.LN = [ ... % total length (inch), fecundity
    12.9  10685
    13.5  20662
    14.4  20774
    15.3  28966
    16.6  34672
    17.5  41969
    18.3  49854
    19.4  78759
    20.1  64400
    21.1 152110
    22.2  89457
    24.6 117058];
data.LN(:,1) = 2.54 * data.LN(:,1);  % convert inch to cm
units.LN = {'cm','#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Caru1963';

% length - weight
data.LWw = [ ... % total length (inch), weight (pound)
    12.9  0.60
    13.5  0.71
    14.4  0.88
    15.3  1.13
    16.6  1.34
    17.5  1.64
    18.3  2.09
    19.4  2.32
    20.1  2.66
    21.5  3.92
    22.2  4.16
    24.6  4.54];
data.LWw(:,1) = 2.54 * data.LWw(:,1);  % convert inch to cm
data.LWw(:,2) = 453.59237 * data.LWw(:,2);  % convert pound to g
units.LWw = {'cm','g'}; label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Caru1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Gf = 5 * weights.tL_Gf;
weights.tL_tf = 5 * weights.tL_tf;
weights.Li = 5 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Gf','tL_Gm'}; subtitle1 = {'Data for females, males from Garrison Reservoir'};
set2 = {'tL_tf','tL_tm'}; subtitle2 = {'Data for females, males from tailrace'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '79HLZ'; % Cat of Life
metaData.links.id_ITIS = '650171'; % ITIS
metaData.links.id_EoL = '211301'; % Ency of Life
metaData.links.id_Wiki = 'Sander_canadensis'; % Wikipedia
metaData.links.id_ADW = 'Sander_canadensis'; % ADW
metaData.links.id_Taxo = '691814'; % Taxonomicon
metaData.links.id_WoRMS = '723270'; % WoRMS
metaData.links.id_fishbase = 'Sander-canadensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sander_canadensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Caru1963'; type = 'Article'; bib = [ ... 
'author = {Louis H. Carufel}, ' ...
'year = {1963}, ' ...
'title = {Life History of Saugers in {G}arrison {R}eservoir}, ' ... 
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {27(3)}, '...
'pages = {450-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sander-canadensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JohnLysa2012'; type = 'Article'; bib = [ ... 
'author = {Tom A. Johnston and Walt Lysack and William C. Leggett}, ' ...
'year = {2012}, ' ...
'title = {Abundance, growth, and life history characteristics of sympatric walleye (\emph{Sander vitreus}) and sauger (\emph{Sander canadensis}) in {L}ake {W}innipeg, {M}anitoba}, ' ... 
'journal = {Journal of Great Lakes Research}, ' ...
'volume = {38}, '...
'pages = {35-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

