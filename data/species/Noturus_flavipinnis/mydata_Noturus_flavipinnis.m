function [data, auxData, metaData, txtData, weights] = mydata_Noturus_flavipinnis
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_flavipinnis'; 
metaData.species_en = 'Yellowfin madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 26]; 

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.5;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'DinkShut1996';
data.Li  = 15;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.15e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DinkShut1996'; 
  comment.Wwb = 'based on egg diameter of 2.8 mm: pi/6*0.28^3';
data.Wwi  = 25.4;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri  = 180/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DinkShut1996';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
112.376 2.492	
190.759 3.531	
246.334 4.005	
294.242 4.494	
329.920 4.011	
365.203 4.776	
365+ 52.212 5.513	
365+112.491 6.530	
365+191.747 7.011	
365+251.480 7.553	
365+332.223 7.739	
365+366.071 8.635	
730+ 51.063 9.141	
730+114.305 9.601	
730+188.046 9.900	
730+249.297 10.048	
730+330.679 10.415	
730+368.160 10.835	
1095+ 52.446 11.374	
1095+367.271 11.442];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DinkShut1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data varied between 5 and 26 C';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '47ZMM'; % Cat of Life
metaData.links.id_ITIS = '164012'; % ITIS
metaData.links.id_EoL = '49291260'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_flavipinnis'; % Wikipedia
metaData.links.id_ADW = 'Noturus_flavipinnis'; % ADW
metaData.links.id_Taxo = '181567'; % Taxonomicon
metaData.links.id_WoRMS = '1013246'; % WoRMS
metaData.links.id_fishbase = 'Noturus-flavipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_flavipinnis}}';
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
bibkey = 'DinkShut1996'; type = 'Article'; bib = [ ... 
'author = {Gerald R. Dinkins and Peggy W. Shute},'...
'title = {Life histories of \emph{Noturus baileyi} and \emph{Noturus flavipinni} ({P}isces; {I}ctaluridae) two rare madtom catfishes in {C}itico {C}reek, {M}onroe {C}ounty, {T}ennessee},'...
'journal = {Bulletin Alabama Mus. Nat. Hist.},'...
'volume = {18},'...
'year = {1996},'...
'pages = {43-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-flavipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

