function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_griseus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_griseus'; 
metaData.species_en = 'Grey snapper '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 08];

%% set data
% zero-variate data

data.ab = (27+45)/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'uwi';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch after 27 h, yolksac absorption after 45 h';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'uwi';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 89;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwi = 9.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1; max reproted weight 20 kg';

data.GSI  = 0.14;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(24.8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lutjanus_sebae';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0  8.8
    1 15.8
    2 24.4
    3 26.0
    4 31.8
    5 35.7
    6 47.9
    7 47.0];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Crok1962';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Subtropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '72PR8'; % Cat of Life
metaData.links.id_ITIS = '168848'; % ITIS
metaData.links.id_EoL = '46580725'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_griseus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_griseus'; % ADW
metaData.links.id_Taxo = '42274'; % Taxonomicon
metaData.links.id_WoRMS = '159797'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-griseus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_griseus}}';
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
bibkey = 'Crok1962'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1962)91[379:GAFOTG]2.0.CO;2}, ' ...
'author = {Croker, Robert A.}, ' ... 
'year = {1962}, ' ...
'title = {Growth and Food of the Gray Snapper, \emph{Lutjanus griseus} in {E}verglades {N}ational {P}ark}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {91(4)}, ' ...
'pages = {379–383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-griseus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'uwi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://sta.uwi.edu/fst/lifesciences/sites/default/files/lifesciences/documents/ogatt/Lutjanus_griseus%%20-%%20Mangrove%%20Snapper%%20or%%20Grey%%20Snapper.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
