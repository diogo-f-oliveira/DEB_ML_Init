function [data, auxData, metaData, txtData, weights] = mydata_Conodon_nobilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Conodon_nobilis'; 
metaData.species_en = 'Barred grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 05 01]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 01]; 

%% set data
% zero-variate data

data.am = 4.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'PombDena2014';   
  temp.am = C2K(26.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'PombDena2014'; 
data.Li  = 33.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 49; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on length-weight of 0.01047*Lp^3.04, see F1';
data.Wwi = 588; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01047*Li^3.04: 457 g, see F1';

data.Ri  = 5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';
  
% uni-variate data
% t-L data for females
data.tL = [ ... % time (D), total length (cm)
101.095	6.032
144.474	8.359
166.567	9.309
200.120	10.923
229.989	12.301
258.225	13.773
285.627	14.485];
data.tL(:,1) = data.tL(:,1) - 10;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PombDena2014';
comment.tL = 'data from length frequencies; only high-frquency values are used';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
F1 = 'weight-length relationship: W in g = 0.01047*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'XQZX'; % Cat of Life
metaData.links.id_ITIS = '169090'; % ITIS
metaData.links.id_EoL = '46578514'; % Ency of Life
metaData.links.id_Wiki = 'Conodon_nobilis'; % Wikipedia
metaData.links.id_ADW = 'Conodon_nobilis'; % ADW
metaData.links.id_Taxo = '171646'; % Taxonomicon
metaData.links.id_WoRMS = '280386'; % WoRMS
metaData.links.id_fishbase = 'Conodon-nobilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conodon}}';
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
bibkey = 'PombDena2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-014-0387-2}, ' ...
'author = {Ma\''{i}ra Pombo and M\''{a}arcia Regina Denadai and Eduardo Bessa and Fl\''{a}avia Borges Santos and Vanessa Hermann de Faria and Alexander Turra}, ' ... 
'year = {2014}, ' ...
'title = {The barred grunt \emph{Conodon nobilis} ({P}erciformes: {H}aemulidae) in shallow areas of a tropical bight: spatial and temporal distribution, body growth and diet}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {68}, ' ...
'pages = {271-279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Conodon-nobilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
