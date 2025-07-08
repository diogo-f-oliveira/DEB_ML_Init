function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_atlanticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_atlanticus'; 
metaData.species_en = 'Blackfin tuna'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 15];

%% set data
% zero-variate data

data.ab = 4.5;    units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';
  temp.ab = C2K(14.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11 * 365; units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(14.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 49.4;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 108;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb  = 4.63e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.96 mm: pi/6*0.096^3';
data.Wwi  = 18.3e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.05, see F1';

data.GSI = 0.65; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BezeFern2013';
  temp.GSI = C2K(14.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.264	29.889
0.474	39.855
0.475	43.566
0.475	44.543
0.475	46.887
0.484	30.871
0.484	39.074
0.486	51.379
0.486	53.527
0.495	40.832
0.496	46.106
0.505	37.317
0.505	37.708
0.506	42.786
0.507	50.403
0.507	52.161
0.515	33.216
0.515	34.192
0.517	49.036
0.526	35.950
0.955	40.062
0.955	43.773
0.976	40.844
0.976	42.407
0.976	44.555
0.977	51.782
0.977	53.149
0.977	55.493
0.985	35.180
0.986	37.915
0.986	45.532
0.987	46.508
0.987	52.368
0.997	49.634
0.997	50.610
1.008	47.681
1.018	48.853
1.468	60.192
1.478	54.724
1.479	57.263
1.479	58.825
1.489	60.583
1.498	47.888
1.499	50.232
1.499	53.162
1.499	56.287
1.500	64.099
1.500	65.857
1.509	49.060
1.958	52.001
1.980	56.298
1.980	62.939
1.991	61.767
1.991	65.283
2.000	49.658
2.000	52.979
2.003	74.463
2.011	60.010
2.020	39.502
2.461	68.419
2.492	65.686
2.493	66.662
2.502	54.358
2.503	63.342
2.523	60.999
2.554	52.015
2.973	64.330
2.983	62.182
2.984	72.143
2.984	73.706
3.003	54.956
3.004	65.698
3.005	74.097
3.026	69.410
3.454	72.350
3.475	74.108
3.475	75.475
3.486	79.187
4.018	69.434
4.018	74.317
4.019	83.301
4.499	73.938
4.509	75.501
4.529	68.861
5.010	75.318
5.982	80.419
5.983	84.326
5.993	85.889
6.004	87.451
6.025	91.944
6.526	87.855
6.536	79.261
7.028	90.015
7.538	80.457];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(14.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AdamKers2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.05';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56P6Z'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577337'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_atlanticus'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_atlanticus'; % ADW
metaData.links.id_Taxo = '189035'; % Taxonomicon
metaData.links.id_WoRMS = '159343'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-atlanticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_atlanticus}}';
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
bibkey = 'AdamKers2014'; type = 'Article'; bib = [ ... 
'author = {Adams, J.L. and D.W. Kerstetter}, ' ... 
'year = {2014}, ' ...
'title = {Age and growth of three coastal-pelagic tunas ({A}ctinopterygii: {P}erciformes: {S}combridae) in the {F}lorida {S}traits, {U}{S}{A}: blackfin tuna, \emph{Thunnus atlanticus}, little tunny, \emph{Euthynnus alletteratus}, and skipjack tuna, \emph{Katsuwonus pelamis}}, ' ...
'journal = {Acta Ichthyol. Piscat.}, ' ...
'volume = {44(3)}, ' ...
'pages = {201-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BezeFern2013'; type = 'Article'; bib = [ ... 
'author = {Natalia P.A. Bezerra and Cezar A.F. Fernandes and Fernanda V. Albuquerque and Vanessa Pedrosa and F\''{A}bio Hazin and Paulo Travassos1}, ' ... 
'year = {2013}, ' ...
'title = {Reproduction of Blackfin tuna \emph{Thunnus atlanticus} ({P}erciformes: {S}combridae) in {S}aint {P}eter and {S}aint {P}aul {A}rchipelago, {E}quatorial {A}tlantic, {B}razil}, ' ...
'journal = {Revista de Biologia Tropical}, ' ...
'volume = {61(3)}, ' ...
'pages = {1327-1339}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thunnus-atlanticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

