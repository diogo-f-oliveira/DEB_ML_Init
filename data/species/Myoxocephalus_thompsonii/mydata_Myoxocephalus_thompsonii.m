function [data, auxData, metaData, txtData, weights] = mydata_Myoxocephalus_thompsonii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Myoxocephalus_thompsonii'; 
metaData.species_en = 'Deepwater sculpin'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 23];


%% set data
% zero-variate data

data.tp = 3 * 365; units.tp = 'd';   label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';   
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Li  = 23;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 1.5-2.2 mm : pi/6*0.2^3';
data.Wwi = 129.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';

data.Ri = 481/365; units.Ri = '#/d'; label.Ri = 'reproduction rate at TL 13 cm'; bibkey.Ri = 'ADW';
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'length is guessed';

% uni-variate data
% time-length
data.tL = [ ... % age (d), total length (cm) 
    0 0.65
   60 0.95
   90 1.30
  120 1.75];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GeffNash1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '456LZ'; % Cat of Life
metaData.links.id_ITIS = '644664'; % ITIS
metaData.links.id_EoL = '225010'; % Ency of Life
metaData.links.id_Wiki = 'Myoxocephalus_thompsonii'; % Wikipedia
metaData.links.id_ADW = 'Myoxocephalus_thompsonii'; % ADW
metaData.links.id_Taxo = '3417665'; % Taxonomicon
metaData.links.id_WoRMS = '567535'; % WoRMS
metaData.links.id_fishbase = 'Myoxocephalus-thompsonii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myoxocephalus_thompsonii}}';
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
bibkey = 'GeffNash1992'; type = 'Article'; bib = [ ... 
'author = {A. J. Geffen and R. D. M. Nash}, ' ... 
'year = {1992}, ' ...
'title = {The life-history strategy of deepwater sculpin, \emph{Myoxocephalus thompsonii} ({G}irard), in {L}ake {M}ichigan: dispersal and settlement patterns during the first year of life}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {41 (suppl B)}, ' ...
'pages = {101-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myoxocephalus-thompsonii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Myoxocephalus_thompsonii/l}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

