function [data, auxData, metaData, txtData, weights] = mydata_Lepomis_gibbosus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Lepomis_gibbosus'; 
metaData.species_en = 'Pumpkinseed'; 

metaData.ecoCode.climate = {'BSk','Cfa','Cfb','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fs', 'Fv', 'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp, based on laboratory conditions 
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_f'};

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2023 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 06]; 

%% set data
% zero-variate data
data.tp = 2*365;        units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishbase';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 9.0;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'CoppFox2007'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 30.2;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on Wwi';

data.Wwb = 6.98e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 1.1 mm of Lepomis cyanellus: pi/6*0.11^3';
data.Wwp = 13;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','CoppFox2007'}; 
  comment.Wwp = 'based on 0.01445*Lp^3.10, see F1';
data.Wwi = 630;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 

data.Ri = 1700/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), total length (cm)
    1  3.5  5.8  5.1
    2  4.9  7.7  8.6
    3  6.1  9.0 11.1
    4  7.2 10.3 13.2
    5  8.2 10.9 15.0
    6  9.0 10.9 16.4
    7 10.2 10.9 NaN
    8 11.0 11.5 NaN
    9 11.4 NaN  NaN
    ];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CoppFox2007'; treat.tL = {1, {'Douster Pond, UK','Divor Reservoir, P','Danube, SK'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'TL-weight: weight (in g) = 0.0115 * (TL in cm)^3.2';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links 
metaData.links.id_CoL = '3TG2F'; % Cat of Life
metaData.links.id_ITIS = '168144'; % ITIS
metaData.links.id_EoL = '995125'; % Ency of Life
metaData.links.id_Wiki = 'Lepomis_gibbosus'; % Wikipedia
metaData.links.id_ADW = 'Lepomis_gibbosus'; % ADW
metaData.links.id_Taxo = '45133'; % Taxonomicon
metaData.links.id_WoRMS = '151290'; % WoRMS
metaData.links.id_fishbase = 'Lepomis-gibbosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepomis_gibbosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepomis-gibbosus}}';
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
bibkey = 'CoppFox2007'; type = 'incollection'; bib = [ ... 
'doi = {10.1007/978-1-4020-6029-8_15}, ' ...
'author = {Gordon H. Copp and Michael G. Fox}, ' ... 
'year = {2007}, ' ...
'title = {Growth and life history traits of introduced pumpkinseed (\emph{Lepomis gibbosus}) in {E}urope, and the relevance to its potential invasiveness}, ' ...
'booktitle = {Biological invaders in inland waters: Profiles, distribution, and threats}, ' ...
'series = {Invading Nature - Springer Series In Invasion Ecology}, ' ...
'volume = {2}, ' ...
'chapter = {15}, ' ...
'pages = {289–306'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
