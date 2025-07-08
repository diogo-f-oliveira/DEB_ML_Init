function [data, auxData, metaData, txtData, weights] = mydata_Siganus_luridus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_luridus'; 
metaData.species_en = 'Dusky spinefoot'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-W'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Orestis Stavrakidis-Zachou','Evridiki Klagkou','Eleni Livanou','Dina Lika'};    
metaData.date_subm = [2024 12 16];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'University of Crete, UoC'};    

metaData.curator    = {'Bas Kooijman'};
metaData.email_cur  = {'bas.kooijman@vu.nl'};
metaData.date_acc   = [2024 12 16];

%% set data
% zero-variate data

data.ah = 29/24;  units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'PoppPitt1979';   
  temp.ah = C2K(25.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; 
data.ab = 10;  units.ab = 'd';    label.ab = 'age at hatch';             bibkey.ab = 'PoppPitt1979';   
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bari2005';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BariHarm2003'; 
data.Li  = 25.28;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Bari2005';

data.Wwb = 9.2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bari2005';
 comment.Wwb = 'based on egg diameter of 0.56 mm: pi/6*0.056^3';
data.Wwp = 45; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Bari2005';
 comment.Wwp = 'based on Lp and LW_1 data';
data.Wwi = 247.67; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Bari2005';

data.Ri = 315433/365;  units.Ri = '#/d';    label.Ri = 'max reprodion rate';   bibkey.Ri = 'AzzuCarn2007';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% length-weight
data.LW_1 = [... % total length (cm), wet weight (g)
    7.659	6.063
    10.070	13.248
    11.951	24.547
    14.065	42.814
    15.941	72.169
    17.935	102.924
    19.810	137.833
    21.857	192.205
    23.901	257.687
    25.885	331.496
    27.983	419.206];
units.LW_1  = {'cm','g'};  label.LW_1 = {'total length', 'wet weight'};  
bibkey.LW_1 = 'Bari2005';
%
data.LW_2 = [... length(cm), wet weight (g)
    10.151	26.071
    10.927	28.725
    11.239	33.815
    11.510	33.863
    11.899	36.449
    12.133	44.042
    12.288	45.328
    12.326	40.300
    12.754	42.892
    12.793	47.934
    12.988	54.262
    12.987	42.933
    12.986	34.123
    13.568	38.001
    13.571	55.623
    13.493	56.868
    13.375	44.261
    14.034	34.307
    13.880	43.091
    13.842	50.636
    14.037	56.964
    14.230	53.222
    14.385	51.991
    14.580	52.025
    14.851	52.073
    14.851	52.073
    14.736	63.380
    14.426	63.326
    14.310	68.340
    14.699	75.960
    14.273	78.402
    15.048	74.763
    15.047	64.694
    15.319	63.483
    15.511	49.672
    15.552	66.041
    15.591	69.824
    15.593	81.152
    15.399	82.377
    15.245	91.160
    15.324	101.243
    15.751	103.836
    15.751	100.060
    15.750	93.767
    15.748	83.697
    16.019	76.193
    16.134	61.109
    16.250	61.130
    16.214	81.262
    16.137	87.542
    16.061	97.597
    16.061	97.597
    16.295	102.673
    16.450	102.700
    16.488	98.931
    16.486	83.827
    16.757	77.581
    17.185	82.691
    17.030	83.923
    16.836	91.441
    16.838	100.251
    17.382	106.641
    17.497	94.074
    17.305	109.144
    16.878	109.069
    17.538	112.961
    17.732	112.996
    17.885	97.919
    17.693	110.471
    17.579	126.814
    17.463	131.828
    17.736	143.204
    17.775	143.211
    17.929	129.393
    18.006	125.630
    18.198	115.595
    18.470	110.608
    18.472	125.712
    18.433	129.482
    18.163	139.503
    17.970	148.280
    18.321	157.152
    18.398	157.166
    18.708	148.410
    18.860	128.298
    18.859	123.263
    18.896	104.390
    19.248	124.591
    19.248	129.625
    19.211	142.205
    19.018	148.465
    18.979	149.716
    18.476	155.921
    18.981	157.268
    19.214	162.344
    19.217	181.224
    19.410	172.448
    19.447	163.644
    19.446	152.316
    19.522	141.001
    19.909	133.518
    19.834	151.126
    19.834	153.643
    19.758	163.699
    19.722	183.831
    19.645	191.369
    19.801	197.690
    19.877	183.858
    19.952	167.509
    20.262	158.753
    20.376	139.893
    20.264	173.857
    20.264	173.857
    20.150	191.458
    20.152	207.821
    20.618	210.420
    20.616	192.799
    20.614	176.436
    20.612	165.108
    20.883	161.380
    20.886	181.519
    20.889	205.434
    20.891	216.762
    20.348	219.183
    20.349	231.770
    21.270	150.120
    21.273	172.776
    21.274	176.552
    21.276	195.433
    21.277	199.209
    21.278	213.054
    21.279	215.571
    21.164	225.620
    21.088	238.194
    20.972	245.725
    21.362	257.122
    21.439	250.842
    21.552	229.465
    21.590	220.661
    21.705	208.095
    21.820	195.528
    21.818	180.424
    21.711	253.407
    21.711	252.149
    21.941	230.792
    22.017	221.995
    22.210	209.442
    22.363	194.365
    21.945	263.518
    21.945	263.518
    22.177	252.231
    22.292	242.182
    22.446	232.140
    22.639	224.622
    22.872	225.921
    23.338	229.780
    23.028	236.018
    22.796	242.271
    22.604	253.565
    22.566	257.334
    22.219	277.411
    21.754	282.364
    22.337	290.018
    22.414	284.997
    22.607	274.962
    22.955	263.696
    22.954	258.661
    23.380	253.701
    23.767	241.183
    23.768	252.511
    23.537	266.316
    23.152	287.645
    23.035	283.848
    22.610	300.136
    22.612	311.464
    23.194	311.567
    23.387	302.790
    23.501	283.930
    23.888	276.447
    24.159	271.460
    24.356	289.116
    24.086	301.654
    23.545	321.698
    23.971	315.479
    23.776	307.893
    23.974	336.877
    24.167	326.842
    24.553	311.806
    24.748	316.875
    24.789	335.762
    25.254	329.551];
units.LW_2  = {'cm','g'};  label.LW_2 = {'total length', 'wet weight'};  
bibkey.LW_2 = 'ShakWink2008';

% time-length
data.tL_1 = [ ... time since birth (y), length (cm)
    0.98	79.52
    0.98	87.85
    0.98	102.44
    0.98	113.89
    0.97	126.40
    0.96	134.73
    1.98	140.63
    1.98	152.09
    1.97	159.39
    1.95	165.64
    1.95	181.26
    2.98	167.37
    2.99	179.86
    2.99	187.16
    2.99	193.41
    2.99	214.24
    4.00	195.14
    3.99	208.68
    3.99	222.22
    3.99	227.43
    3.99	233.68
    4.99	232.30
    4.98	239.59
    5.97	239.25
    5.98	245.49];
data.tL_1(:,1) = 365 * (0.3+data.tL_1(:,1));  % convert yr to d
for i=2:size(data.tL_1,1); if data.tL_1(i,1)<=data.tL_1(i-1,1); data.tL_1(i,1)=data.tL_1(i-1,1)+1e-3; end; end
data.tL_1(:,2) = data.tL_1(:,2)/10;  % convert mm to cm
units.tL_1  = {'d', 'cm'};  label.tL_1 = {'time since birth', 'total length'};  
bibkey.tL_1 = 'Bari2005';
comment.tL_1 = 'no info on temp, used average of the area';
%
temp.tL_1 = [... % Month,    Temperature (°C)
   1   17.5  % March
   2   18    % April
   3   21.5  % May
   4   25    % June
   5   27    % July
   6   28    % August
   7   28    % September
   8   26    % October
   9   23    % November
   10  20    % December
   11  18    % January
   12  17];  % February
temp.tL_1(:,1) = 30 * temp.tL_1(:,1); % convert mnth to d
units.temp.tL_1 = {'d','C'}; label.temp.tL_1 = 'temperature';
%
data.tL_2 = [... time since birth (d), total length (cm)
    1.17	10.79
    2.12	15.53
    2.15	14.70
    2.15	14.23
    2.15	13.64
    2.15	13.04
    3.10	18.85
    3.11	18.26
    3.11	17.79
    3.11	17.31
    3.11	16.72
    3.11	16.25
    3.11	15.53
    3.11	15.30
    4.05	22.06
    4.04	20.99
    4.04	20.63
    4.04	19.68
    4.04	19.09
    4.05	18.50
    4.07	17.67
    5.01	22.89
    5.01	22.77
    5.03	22.17
    5.04	21.82
    5.04	21.34
    5.04	20.16
    5.05	19.45
    6.00	24.43
    5.99	23.48
    5.99	23.00
    5.99	22.53
    5.99	22.06
    6.01	20.99
    6.95	25.61
    6.96	24.66];
data.tL_2(:,1) = 365 * (0.3 + data.tL_2(:,1));  % convert yr to d
for i=2:size(data.tL_2,1); if data.tL_2(i,1)<=data.tL_2(i-1,1); data.tL_2(i,1)=data.tL_2(i-1,1)+1e-3; end; end
units.tL_2  = {'d', 'cm'};  label.tL_2 = {'time since birth', 'total length'};  
temp.tL_2   = C2K(21.5);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = 'ShakWink2008';
comment.tL_2 = 'no info on temp, used average of the area';

% length-fecundity
data.LN = [ ... length (cm), fecundity (#)
    15.98	167947.28
    16.94	120689.67
    17.99	174595.75
    18.91	219983.26
    19.96	226858.83
    20.95	429000.83
    22.00	368893.53
    22.96	548237.49
    23.99	317114.78];
units.LN  = {'cm', '#/d'};  label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(22); units.temp.LN= 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BariSade2009';
comment.LN = 'temp is an average of the area, 1 spawning a year';

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

%% Facts

%% Links
metaData.links.id_CoL = '6YMVB'; % Cat of Life
metaData.links.id_ITIS = '623216'; % ITIS
metaData.links.id_EoL = '46577143'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_luridus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_luridus'; % ADW
metaData.links.id_Taxo = '46749'; % Taxonomicon
metaData.links.id_WoRMS = '127044'; % WoRMS
metaData.links.id_fishbase = 'Siganus-luridus'; % fishbase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bari2005'; type = 'Article'; bib = [ ... 
'author = {Bariche, M.}, ' ... 
'year = {2005}, ' ...
'title = {Age and growth of Lessepsian rabbitfish from the eastern {M}editerranean}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {21}, ' ...
'pages = {141–145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BariSade2009'; type = 'Article'; bib = [ ... 
'author = {Bariche, M. and Sadek, R. and Azzurro, E.}, ' ... 
'year = {2009}, ' ...
'title = {Fecundity and condition of succesful invaders: \emph{Siganus rivulatus} and \textit{S. luridus} ({A}ctinopterygii: {P}erciformes: {S}iganidae) in the eastern {M}editerranean sea}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {39}, ' ...
'pages = {11-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoppPitt1979'; type = 'Article'; bib = [ ... 
'author = {Popper, D. and Pitt, R. and Zohar, Y.}, ' ... 
'year = {1979}, ' ...
'title = {Experiments on the popagation of {R}ed sea siganuds and some notes on their reproduction in nature}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {16}, ' ...
'pages = {177-181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BariHarm2003'; type = 'Article'; bib = [ ... 
'author = {Bariche, M. and Harmelin-Vivien, M. and Quignard, J.-P.}, ' ... 
'year = {2003}, ' ...
'title = {Reproductive cycles and spawning periods of two {L}essepsian siganid fishes on the {L}ebanese coast}, ' ...
'journal = {J. Sea Biol.}, ' ...
'volume = {62}, ' ...
'pages = {129-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AzzuCarn2007'; type = 'Article'; bib = [ ... 
'author = {Azzurro, E. and Carnevali, O. and Bariche, M. and Andaloro, F.}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive features of the non-native \emph{Siganus luridus} ({T}eleostei,{S}iganidae) during early colonization at {L}inosa {I}sland ({S}icily {S}trait, {M}editerranean {S}ea)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {23}, ' ...
'pages = {640-645}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShakWink2008'; type = 'Article'; bib = [ ... 
'author = {Shakman, E. and Winkler, H. and Oeberst, R. and Kinzelbach, R.}, ' ... 
'year = {2008}, ' ...
'title = {Morphometry, age and growth of Siganus luridus Rüppell, 1828 and \emph{Siganus rivulatus} {F}orsskål, 1775 ({S}iganidae) in the central {M}editerranean ({L}ibyan coast)}, ' ...
'journal = {Revista de Biología Marina y Oceanografía}, ' ...
'volume = {43}, ' ...
'pages = {521-529}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

