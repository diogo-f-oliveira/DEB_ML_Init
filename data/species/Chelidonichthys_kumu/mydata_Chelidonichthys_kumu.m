function [data, auxData, metaData, txtData, weights] = mydata_Chelidonichthys_kumu
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Chelidonichthys_kumu'; 
metaData.species_en = 'Bluefin gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 01];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(19.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(19.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.2;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 60;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 91.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.07, see F1';
data.Wwi = 1.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.00776*Li^3.07, see F1, gives 2.2e3';
 
data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'StewFowl2022';
  temp.GSI = C2K(19.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (yr), fork length (cm)
1.312	26.497
1.328	25.208
1.344	23.125
1.344	21.935
1.359	33.043
1.359	24.315
1.375	32.150
1.375	20.051
1.391	31.258
1.391	30.167
1.391	29.076
1.391	27.886
1.391	21.043
2.344	35.733
2.344	35.337
2.344	28.890
2.359	43.568
2.359	41.486
2.359	40.792
2.359	39.601
2.359	36.825
2.359	32.858
2.359	23.337
2.359	21.453
2.359	20.659
2.375	44.858
2.375	39.007
2.375	31.569
2.375	30.478
2.375	27.800
2.375	26.709
2.375	24.230
2.375	22.345
2.391	42.379
2.391	25.321
2.406	34.346
3.359	29.499
3.359	28.111
3.359	27.714
3.375	39.615
3.375	38.127
3.391	40.408
3.391	34.656
3.391	33.665
3.406	41.202
3.422	49.533
3.422	36.541
3.422	26.624
4.359	43.595
4.406	50.042
4.406	41.017
4.406	33.281
4.422	48.455
5.375	35.278
5.391	36.270
5.406	36.964
5.406	52.138
5.422	30.617
5.422	49.559
6.375	34.795
6.391	38.365
9.422	29.777
9.438	24.323
12.453	31.603
13.437	50.360];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
  temp.tL_f = C2K(19.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewFowl2022';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since hatch (yr), fork length (cm)
1.547	25.905
1.547	24.318
1.594	28.286
1.594	21.641
1.609	16.087
1.609	19.955
1.609	19.558
1.625	25.212
1.625	23.030
1.625	20.848
2.547	24.530
2.563	33.059
2.563	30.976
2.578	39.307
2.578	36.034
2.578	30.580
2.578	30.480
2.578	24.232
2.578	21.257
2.594	37.522
2.594	36.729
2.594	34.745
2.594	29.290
2.594	28.497
2.594	27.902
2.594	26.811
2.609	31.770
2.609	27.605
2.609	25.820
2.609	22.448
2.609	21.853
2.609	18.877
2.625	26.316
2.625	23.142
3.563	41.204
3.578	40.014
3.578	32.180
3.578	28.609
3.578	24.841
3.594	39.320
3.594	38.725
3.594	38.428
3.594	29.304
3.594	27.717
3.594	26.626
3.609	48.048
3.625	33.965
4.578	41.912
4.609	35.863
4.625	31.301
4.625	30.706
4.625	27.631
5.578	30.024
5.594	31.909
5.625	36.868
6.594	32.914
6.625	43.625
8.609	38.891];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
  temp.tL_m = C2K(19.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewFowl2022';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58QJR'; % Cat of Life
metaData.links.id_ITIS = '167041'; % ITIS
metaData.links.id_EoL = '46568714'; % Ency of Life
metaData.links.id_Wiki = 'Chelidonichthys_kumu'; % Wikipedia
metaData.links.id_ADW = 'Chelidonichthys_kumu'; % ADW
metaData.links.id_Taxo = '189452'; % Taxonomicon
metaData.links.id_WoRMS = '127266'; % WoRMS
metaData.links.id_fishbase = 'Chelidonichthys-kumu'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Chelidonichthys_kumu}}';  
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
bibkey = 'StewFowl2022'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.rsma.2022.102720}, ' ...
'author = {John Stewart and Ashley M. Fowler and Nicholas M. Meadows and Daniel D. Johnson}, ' ...
'year = {2022}, ' ...
'title = {Life-history traits and commercial catch composition of \emph{Chelidonichthys kumu} in south-eastern {A}ustralia}, ' ... 
'journal = {Regional Studies in Marine Science}, ' ...
'pages = {56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chelidonichthys-kumu.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

