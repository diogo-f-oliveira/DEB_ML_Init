function [data, auxData, metaData, txtData, weights] = mydata_Gymnelus_viridis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Gymnelus_viridis'; 
metaData.species_en = 'Fish doctor'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm  = [2019 03 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 25];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'arcodiv';   
  temp.am = C2K(-0.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at leat 12 yr';
  
data.Lp  = 10;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 30;   units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'arcodiv';
  comment.Li = 'fishbased give 56 cm, but other sources 30 cm';
  
data.Wwb = 0.0335;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'arcodiv';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 163;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00363*Li^3.15, see F1';

data.Ri  = 106/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 13 cm';    bibkey.Ri  = 'arcodiv';   
  temp.Ri = C2K(-0.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Length 13 cm is guessed on the basis of most frequently length';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0 3.56
1 5.60
2 7.52];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(-0.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DunbGree2017';

 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00363*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3HPPB'; % Cat of Life
metaData.links.id_ITIS = '631028'; % ITIS
metaData.links.id_EoL = '46574735'; % Ency of Life
metaData.links.id_Wiki = 'Gymnelus'; % Wikipedia
metaData.links.id_ADW = 'Gymnelus_viridis'; % ADW
metaData.links.id_Taxo = '175531'; % Taxonomicon
metaData.links.id_WoRMS = '127096'; % WoRMS
metaData.links.id_fishbase = 'Gymnelus-viridis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnelus}}';
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
bibkey = 'DunbGree2017'; type = 'Article'; bib = [ ... 
'author = {R. Dunbrack and J. M. Green}, ' ... 
'year = {2017}, ' ...
'title = {Life History Differences and Latitudinal Variation in Recruitment in Two Species of {A}rctic-{B}oreal {P}erciform Fishes, the Fish Doctor \emph{Gymnelus viridis} and the {A}rctic \emph{Shanny Stichaeus punctatus}}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {380-392}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnelus-viridis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'specident'; type = 'Misc'; bib = ...
'howpublished = {\url{http://species-identification.org/species.php?species_group=fnam&id=1676}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arcodiv'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arcodiv.org/Fish/Gymnelus_viridis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

