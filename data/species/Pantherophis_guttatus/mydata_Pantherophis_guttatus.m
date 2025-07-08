function [data, auxData, metaData, txtData, weights] = mydata_Pantherophis_guttatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Pantherophis_guttatus'; 
metaData.species_en = 'Corn snake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTg', 'biTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 24];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 600;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 32.3*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 30.5;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'BarnHoll1979';  
data.Li  = 182;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 7.5;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'BarnHoll1979';
data.Wwi = 1642;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li, LW data: (182/133)^3*641';
  
data.Ri  = 24/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12 eggs per clutch, 2 clutches per yr assumed';

% univariate data
% length-weight
data.LW = [ ... % total length (cm), weight (g)
 30.239	  7.559
 30.770	  7.021
 31.646	  7.659
 32.659	  7.658
 33.351	  7.555
 34.075	 12.001
 35.035	  9.812
 35.407	 10.214
 35.903	  9.551
 35.908	 10.995
 36.411	  9.876
 36.931	 11.836
 37.981	 12.486
 37.983	 13.087
 39.477	 14.276
 39.609	 12.153
 40.318	 15.265
 42.196	 15.995
 44.953	 21.336
 45.107	 19.952
 46.885	 23.432
 47.549	 24.722
 48.395	 28.651
 48.902	 26.434
 49.595	 28.456
 50.645	 26.966
 51.906	 30.220
 51.917	 36.464
 53.016	 35.021
 53.948	 32.746
 54.150	 41.690
 54.527	 38.984
 55.098	 35.726
 55.883	 41.683
 56.875	 45.784
 58.494	 48.953
 59.310	 42.803
 60.151	 46.700
 60.792	 51.641
 60.806	 64.007
 61.865	 51.636
 62.307	 57.485
 63.420	 70.767
 64.756	 60.642
 64.760	 64.850
 66.131	 62.284
 66.149	 80.369
 68.262	 77.185
 68.499	 74.139
 69.231	 84.212
 69.461	 71.209
 69.713	 79.809
 69.720	 88.258
 72.207	 92.484
 73.478	 88.827
 73.481	 92.475
 74.265	102.948
 75.309	 99.544
 76.369	 97.554
 79.101	113.047
 80.496	112.281
 81.069	122.508
 84.554	134.541
 84.561	145.819
 85.751	142.903
 85.756	150.782
 86.040	125.799
 87.275	161.229
 88.495	142.879
 89.128	163.388
 89.440	161.208
 89.443	166.707
 89.445	171.241
 90.709	177.069
 91.323	139.073
 92.305	167.801
 92.636	181.864
 92.969	197.106
 93.628	209.365
 93.960	217.960
 94.602	181.843
 94.928	172.338
 95.281	210.755
 96.278	193.142
 96.948	181.820
 97.991	222.341
 98.668	199.705
100.072	225.319
100.783	244.198
100.788	255.939
101.124	216.417
101.843	236.130
103.633	219.312
103.653	266.411
105.120	279.199
106.211	236.077
106.236	296.558
106.592	255.862
106.971	269.964
106.987	310.805
107.742	321.395
108.105	281.036
108.828	203.658
108.847	242.465
109.260	319.222
109.616	250.727
110.033	336.809
110.401	288.647
111.592	360.152
112.367	334.520
112.385	390.329
112.749	302.491
113.561	357.710
113.947	323.461
114.377	417.373
114.392	477.302
114.751	334.482
115.587	428.700
115.998	452.328
116.377	357.664
116.383	374.860
116.796	392.875
116.824	496.850
117.998	304.453
118.430	355.239
118.450	417.295
120.090	329.944
120.139	490.155
120.150	534.820
120.551	452.234
120.998	553.043
121.345	298.342
121.805	392.787
122.280	575.725
123.532	425.682
123.993	531.155
125.266	400.712
126.193	579.502
126.199	607.364
127.481	414.342
127.510	517.014
127.943	464.386
129.311	531.035
129.789	640.754
130.693	603.190
133.474	640.658];
units.LW  = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BarnHoll1979';
comment.LW = 'Data for mixed sexes';

% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g): females, males
 42.811	 11.111   8.333
 81.473	 23.611  16.667
125.657	 38.889  33.333
147.737	 52.778  44.444
187.768	 72.222  63.889
216.737	 95.833  84.722
242.975	102.778 101.389
307.786	168.056 147.222
335.362	197.222 177.778
365.693	230.556 206.944
396.025	263.889 244.444
423.577	305.556 280.556
451.093	365.278 327.778
482.841	380.556 350.000
543.466	466.667 426.389
570.913	561.111 488.889
604.000	598.611 511.111
624.668	627.778 502.778
659.152	656.944 531.944
688.234	623.611 540.278
721.334	654.167 558.333];
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm   = C2K(27);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'BarnHoll1979'; treat.tW_fm = {1, {'female', 'male'}};
comment.tW_fm = 'Winter ambient temperatures were 20-24 C, Summer temperatures 28-34 C during the day, 24-27 C at night; heaviest individuals are selected';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 10 * weights.tW_fm;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 0 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 50 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '75LTS'; % Cat of Life
metaData.links.id_ITIS = '1081818'; % ITIS
metaData.links.id_EoL = '47047069'; % Ency of Life
metaData.links.id_Wiki = 'Pantherophis_guttatus'; % Wikipedia
metaData.links.id_ADW = 'Pantherophis_guttatus'; % ADW
metaData.links.id_Taxo = '1685064'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pantherophis&species=guttatus'; % ReptileDB
metaData.links.id_AnAge = 'Elaphe_guttata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spalerosophis_diadema}}';
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
bibkey = 'BarnHoll1979'; type = 'Article'; bib = [ ... 
'author = {S. M. Barnard and T. G. Hollinger and T. A. Romaine}, ' ... 
'year = {1979}, ' ...
'title = {Growth and Food Consumption in the Corn Snake, \emph{Elaphe guttata guttata} ({S}erpentes: {C}olubridae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {1979(4)}, ' ...
'pages = {739-741}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elaphe_guttata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
