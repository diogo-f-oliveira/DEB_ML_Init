function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_obesus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_obesus'; 
metaData.species_en = 'Bigeye tuna'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 17];


%% set data
% zero-variate data

data.ab = 0.88;    units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';
  temp.ab = C2K(28.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 105;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = '100 to 125 cm, not clear if this is TL or FL';
data.Li  = 233;   units.Li  = 'cm';  label.Li  = 'ultimate fork lenth length';   bibkey.Li  = 'fishbase';
  comment.Li = '250 TL, converted to FL, see F1';

data.Wwb  = 6.06e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwi  = 210e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase';

data.Ri = 10.4e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.395	37.651
0.411	32.500
0.446	35.720
0.463	33.788
0.463	37.008
0.548	36.364
0.582	37.651
0.599	37.651
0.617	45.379
0.634	44.735
0.702	45.379
0.720	50.530
0.753	40.871
0.822	46.023
0.959	54.394
0.959	56.970
0.959	59.545
1.010	54.394
1.095	56.326
1.113	61.477
1.165	65.985
1.232	58.258
1.233	71.136
1.250	66.629
1.267	71.780
1.301	67.273
1.352	64.053
1.455	75.000
1.523	69.205
1.541	81.439
1.574	72.424
1.576	85.303
1.576	91.098
1.609	78.864
1.643	76.288
1.644	82.727
1.762	77.576
1.763	88.523
1.764	91.098
1.797	78.864
1.797	82.083
1.934	85.947
1.935	94.318
1.936	109.129
1.967	83.371
2.004	109.773
2.037	96.250
2.070	86.591
2.088	98.182
2.090	117.500
2.104	85.947
2.157	101.401
2.207	89.167
2.241	94.318
2.244	117.500
2.275	93.674
2.276	96.894
2.329	117.500
2.344	99.470
2.345	109.129
2.412	101.401
2.463	100.114
2.465	114.280
2.499	112.348
2.515	100.114
2.532	103.333
2.567	114.924
2.568	118.788
2.600	104.621
2.619	116.212
2.686	111.705
2.738	120.076
2.754	107.197
2.773	122.651
2.807	124.583
2.873	102.689
2.873	107.197
2.874	113.636
2.927	132.955
2.944	129.735
2.994	117.500
3.045	120.076
3.045	121.364
3.061	112.348
3.063	132.311
3.147	115.568
3.149	137.462
3.165	122.651
3.165	131.023
3.181	116.856
3.252	140.682
3.268	135.530
3.320	139.394
3.353	136.174
3.387	131.667
3.422	137.462
3.439	139.394
3.474	145.189
3.507	134.886
3.541	139.394
3.542	142.614
3.559	143.258
3.609	137.462
3.695	143.901
3.695	146.477
3.696	152.273
3.712	141.970
3.747	149.053
3.798	145.189
3.832	149.053
3.900	151.629
3.969	150.985
2.384	90.032
2.569	117.685
2.944	127.331
2.996	115.756
3.080	129.904
3.147	138.907
3.150	110.611
3.284	133.762
3.335	129.904
3.370	121.543
3.488	137.621
3.505	144.051
3.574	127.331
3.589	150.482
3.760	143.408
3.982	144.051
3.998	155.627
4.067	141.479
4.254	153.698
4.782	158.842
4.917	173.633
4.917	166.559
5.071	166.559
5.174	153.698
5.394	179.421
7.166	189.068
7.354	179.421
8.922	181.350
9.723	187.138];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AireMaun2015';
comment.tL = 'Otolith and capture-recapture measurements combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Measured from photo: FL = 0.933 * TL';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56P7C'; % Cat of Life
metaData.links.id_ITIS = '172428'; % ITIS
metaData.links.id_EoL = '46577335'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_obesus'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_obesus'; % ADW
metaData.links.id_Taxo = '46702'; % Taxonomicon
metaData.links.id_WoRMS = '127028'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-obesus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_obesus}}';
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
bibkey = 'AireMaun2015'; type = 'Article'; bib = [ ... 
'author = {Alexandre M. Aires-da-Silva and Mark N. Maunder and Kurt M. Schaefer and Daniel W. Fuller}, ' ... 
'year = {2015}, ' ...
'title = {Improved growth estimates from integrated analysis of direct agingand tag-recapture data: An illustration with bigeye tuna (\emph{Thunnus obesus}) of the eastern {P}acific {O}cean with implications for management}, ' ...
'journal = {Fisheries Research  () }, ' ...
'volume = {163}, ' ...
'pages = {119-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Thunnus-obesus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

