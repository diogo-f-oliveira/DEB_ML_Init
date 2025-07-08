  function [data, auxData, metaData, txtData, weights] = mydata_Rhinelepis_aspera
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Rhinelepis_aspera'; 
metaData.species_en = 'Armored catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 24];

%% set data
% zero-variate data
data.ab = 11.3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'SatoFene1998';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1.8 d till hatch: assumed: 9.5 d till start feeding';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 60.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'SatoFene1998';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SatoFene1998';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 299;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','SatoFene1998'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi = (28.8/60.5)^3*2774';
data.Wwi = 2774;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'SatoFene1998';

% uni-variate data
% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
0.625	9.157
1.665	16.736
2.673	22.120
3.533	26.403
4.661	32.398
5.639	36.562
6.736	39.751
7.743	43.062
8.899	45.887];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(24.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'AgosBareb1991';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
0.556	11.426
1.392	15.609
2.342	24.214
3.570	27.663
4.435	31.969
5.362	35.293
6.290	38.371
7.274	43.537
8.292	46.371
9.165	44.905];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(24.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'AgosBareb1991';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
42.534	107182.062
43.000	100652.702
43.550	82194.747
43.982	112523.637
45.044	105961.988
46.494	119975.549
49.003	112251.484
50.034	157724.062
51.004	116479.078
52.121	169535.031
54.977	192144.468
56.938	206130.353
58.165	175711.515
60.628	351187.782];
units.LN = {'cm', '##'};  label.LN = {'total length', 'fecundity'};  
  temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'SatoFene1998';

% weight-fecundity
data.WwN = [ ... % total length (cm), fecundity (#)
 885.528	100619.867
 924.081	104732.975
1107.948	 83586.682
1149.466	119153.593
1176.157	109588.244
1205.813	106177.551
1244.365	112341.942
1472.716	169840.294
1508.304	117884.216
1594.306	154147.054
1873.072	206189.110
1979.834	176132.839
2110.320	191211.263
2774.614	348657.907];
units.WwN = {'g', '##'};  label.WwN = {'weight', 'fecundity'};  
  temp.WwN = C2K(24.5);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature'; 
bibkey.WwN = 'SatoFene1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwb = weights.Wwb * 5;
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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7LS'; % Cat of Life
metaData.links.id_ITIS = '680356'; % ITIS
metaData.links.id_EoL = '214849'; % Ency of Life
metaData.links.id_Wiki = 'Rhinelepis_aspera'; % Wikipedia
metaData.links.id_ADW = 'Rhinelepis_aspera'; % ADW
metaData.links.id_Taxo = '185955'; % Taxonomicon
metaData.links.id_WoRMS = '1022672'; % WoRMS
metaData.links.id_fishbase = 'Rhinelepis-aspera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Rhinelepis_aspera}}';  
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
bibkey = 'AgosBareb1991'; type = 'Article'; bib = [ ...
'author = {Agostinho, A. A. and Barbieri, G. and Verani, J. R.}, ' ...
'year = {1991}, ' ...
'title = {Idade e crescimento do cascudo preto \emph{Rhinelepis aspera} ({S}iluriformes, {L}oricariidae) no rio {P}aranapanema, bacia do rio {P}aran\''{a}}, ' ... 
'journal = {Revista Unimar}, ' ...
'volume = {13(2)}, '...
'pages = {259-272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SatoFene1998'; type = 'Article'; bib = [ ...
'author = {Yoshimi Sato and Nelsy Fenerich-Verani and Jos\''{e} Roberto Verani and Hugo Pereira Godinho and Edson Vieira Sampaio}, ' ...
'year = {1998}, ' ...
'title = {Induced Reproduction and Reproductive Characteristics of \emph{Rhinelepis aspera} {A}gassiz, 1829 ({O}steichthyes: {S}iluriformes, {L}oricariidae)}, ' ... 
'journal = {Brazilian Archives of Biology and Technology}, ' ...
'volume = {43}, '...
'pages = {309-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhinelepis-aspera.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

