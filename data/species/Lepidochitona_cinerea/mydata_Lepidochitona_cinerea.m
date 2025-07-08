function [data, auxData, metaData, txtData, weights] = mydata_Lepidochitona_cinerea

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Polyplacophora'; 
metaData.order      = 'Chitonida'; 
metaData.family     = 'Tonicellidae';
metaData.species    = 'Lepidochitona_cinerea'; 
metaData.species_en = 'Common chiton'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wd_L'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 06]; 

%% set data
% zero-variate data

data.tp = 5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'RichGott1974';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Lp = 6 mm';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FishFish1989';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.6;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'RichGott1974';
data.Li  = 2.4;   units.Li  = 'cm';  label.Li  = 'ultimate length'; bibkey.Li  = 'marlin';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'RichGott1974';
  comment.Wwb = 'Based on egg diameter of 160-200 mum:  4/3*pi*0.01^3';
data.Wwj = 4.3e-6;  units.Wwj = 'g'; label.Wwj = 'wet weight at birth'; bibkey.Wwj = 'RichGott1974';
  comment.Wwj = 'Based on settlement following a few hours after hatching';
data.Wd1 = 0.1;  units.Wd1 = 'g'; label.Wd1 = 'flesh dry weight at 10 mm'; bibkey.Wd1 = 'RichGott1974';

data.Ri  = 1800/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate at 14 mm';  bibkey.Ri  = 'RichGott1974';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data
% t-L data
data.tL = [ ... % time since birth (month), length (cm)
4	0.532
16	0.929
28	1.180
40	1.491
52	1.568
64	1.725];
data.tL(:,1) = data.tL(:,1)*30.5; % convert month to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaxtJone1978';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'No sexual dimorphism';
metaData.bibkey.F1 = 'RichGott1974';
F2 = 'Larvae spend only a few hours in the plankton';
metaData.bibkey.F2 = 'FishFish1989';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3TB3R'; % Cat of Life
metaData.links.id_ITIS = '78883'; % ITIS
metaData.links.id_EoL = '46447395'; % Ency of Life
metaData.links.id_Wiki = 'Lepidochitona_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Lepidochitona_cinerea'; % ADW
metaData.links.id_Taxo = '114600'; % Taxonomicon
metaData.links.id_WoRMS = '152774'; % WoRMS
metaData.links.id_molluscabase = '152774'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepidochitona_cinerea}}';
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
bibkey = 'RichGott1974'; type = 'Article'; bib = [ ... 
'author = {Richter, H.-P. and Gotting, K. J.}, ' ... 
'year = {1974}, ' ...
'title = {Oogenese und Sexualitaet kaeferschnecke \emph{Lepodochitina cinereus} ({M}ollusca, {P}olyplacophora)}, ' ...
'journal = {Helgolaender wiss. Meeresunters.}, ' ...
'volume = {26}, ' ...
'pages = {42--62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaxtJone1978'; type = 'Article'; bib = [ ... 
'author = {J. M. Baxter and A. M. Jones}, ' ... 
'year = {1978}, ' ...
'title = {Growth and Population Structure of \emph{Lepidochitona cinereus} ({M}ollusca: {P}olyplacophora)Infected with \emph{Minchinia chitonis} ({P}rotozoa: {S}porozoa) at {E}asthaven, {S}cotland}, ' ...
'journal = {Mar. Biol}, ' ...
'volume = {46}, ' ...
'pages = {305--313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://species-identification.org/species.php?species_group=mollusca&id=756}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FishFish1989'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Fish, J. D. and Fish, S.}, ' ...
'year = {1989}, ' ...
'title  = {A student;s guide to the seashore}, ' ...
'publisher = {Unwon Hyman, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

