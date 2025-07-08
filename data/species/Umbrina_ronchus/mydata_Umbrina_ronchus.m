function [data, auxData, metaData, txtData, weights] = mydata_Umbrina_ronchus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Umbrina_ronchus'; 
metaData.species_en = 'Fusca drum'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAE','MIW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 18];

%% set data
% zero-variate data


data.am = 20*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'guess'; 
 comment.Lp = 'based on Umbrina_canariensis: 23*100/80';
data.Li  = 100;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 282;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00912*Lp^3.08, see F1';
data.Wwi = 13182;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.08, see F1';

data.Ri = 3.6e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(17.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.86';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (mm)
0.892	17.022
1.969	36.171
2.943	49.738
3.893	58.786
4.978	65.177
6.012	68.379
6.993	71.580
8.029	73.188
9.064	74.263];
data.tL(:,1) = (.4 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dard1961';

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00912*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7DGD4'; % Cat of Life
metaData.links.id_ITIS = '169305'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Umbrina_ronchus'; % Wikipedia
metaData.links.id_ADW = 'Umbrina_ronchus'; % ADW
metaData.links.id_Taxo = '189722'; % Taxonomicon
metaData.links.id_WoRMS = '127013'; % WoRMS
metaData.links.id_fishbase = 'Umbrina-ronchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Umbrina_ronchus}}';
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
bibkey = 'Dard1961'; type = 'Article'; bib = [ ... 
'author = {Dardignac, J.}, ' ... 
'year = {1961}, ' ...
'title = {Les ombrines des c\^{o}tes atlantiques du {M}aroc}, ' ...
'journal = {Rev. Trav. Inst. Pêches. Marit.}, ' ...
'volume = { 25(3)}, ' ...
'pages = {263-279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Umbrina-ronchusis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

