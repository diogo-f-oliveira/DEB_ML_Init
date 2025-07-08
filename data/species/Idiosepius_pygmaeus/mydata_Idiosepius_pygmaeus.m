function [data, auxData, metaData, txtData, weights] = mydata_Idiosepius_pygmaeus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Idiosepida'; 
metaData.family     = 'Idiosepiidae';
metaData.species    = 'Idiosepius_pygmaeus'; 
metaData.species_en = 'Two-toned pygmy squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.am = 80;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Jack1989';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.9;  units.Lp  = 'cm';  label.Lp  = 'dorsal mantle length at puberty'; bibkey.Lp  = 'guess';
data.Lpm  = 0.4;  units.Lpm  = 'cm';  label.Lpm  = 'dorsal mantle length at puberty for male'; bibkey.Lpm  = 'guess';
data.Li  = 1.7;  units.Li  = 'cm';  label.Li  = 'dorsal mantle length at death';   bibkey.Li  = 'Jack1989';

data.Wwb = 1.72e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LewiChoat1993';

data.Ni  = 640;  units.Ni  = '#';   label.Ni  = 'cum reprod at death';             bibkey.Ni  = 'LewiChoat1993';   
  temp.Ni = C2K(27.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (mg)
35.746	35.913
43.446	95.344
43.660	136.660
43.949	272.767
44.532	86.821
45.462	109.897
46.574	134.186
49.911	207.051
53.703	162.029
53.985	289.629
54.837	214.268
56.043	125.535
58.881	259.172
59.119	329.655
59.845	559.331
61.698	132.740
63.187	172.822
63.668	554.412
66.516	468.084
77.008	369.487
79.384	611.291];
data.tWw_f(:,2) = data.tWw_f(:,2)/1e3; % convert mg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(27.5);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Jack1989';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (mg)
35.015	33.493
40.891	90.522
41.388	27.320
41.403	46.764
42.145	63.767
43.609	71.036
43.809	94.123
44.700	67.374
46.517	61.270
48.180	90.411
49.979	61.217
50.734	94.018
51.437	61.195
53.650	93.974
54.411	135.282
54.730	76.944
55.464	84.224
56.019	93.938
59.129	109.689
63.317	105.980
63.877	122.985
65.852	85.282];
data.tWw_m(:,2) = data.tWw_m(:,2)/1e3; % convert mg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(27.5);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Jack1989';
comment.tWw_m = 'Data for males';

% length-weight
data.LWw_f = [ ... % dorsal mantle length (cm), wet weight (mg)
0.645	74.192
0.647	69.966
0.716	85.410
0.808	102.246
0.846	128.980
0.903	154.292
0.929	171.175
0.944	138.770
0.959	138.760
0.988	176.768
0.997	133.100
1.014	176.749
1.093	206.271
1.095	187.960
1.156	297.776
1.206	239.994
1.219	204.774
1.291	263.878
1.306	263.868
1.312	499.075
1.317	286.395
1.389	338.457
1.421	496.181
1.445	462.362
1.455	572.213
1.488	507.401
1.504	604.573
1.511	562.315
1.550	674.963
1.555	566.509
1.698	600.212
1.758	663.549];
data.LWw_f(:,2) = data.LWw_f(:,2)/1e3; % convert mg to g
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'dorsal mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'Jack1989';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % dorsal mantle length (cm), wet weight (mg)
0.581	36.209
0.616	37.593
0.618	65.760
0.624	43.221
0.649	85.457
0.658	48.831
0.663	61.503
0.669	74.175
0.678	54.450
0.679	67.126
0.680	27.689
0.693	54.440
0.695	36.129
0.697	67.113
0.720	58.647
0.720	62.872
0.746	92.431
0.758	92.423
0.769	64.246
0.773	92.412
0.790	90.992
0.791	69.864
0.801	81.125
0.801	113.519
0.818	114.916
0.825	83.925
0.840	110.674
0.846	95.178
0.857	99.395
0.869	112.063
0.880	134.590
0.886	114.868
0.891	110.639
0.903	138.800
0.935	135.960
0.957	128.902
1.012	138.723
1.016	158.438];
data.LWw_m(:,2) = data.LWw_m(:,2)/1e3; % convert mg to g
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'dorsal mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'Jack1989';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ni = 2 * weights.Ni;
weights.Li = 2 * weights.Li;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'The observed high reproduction is hard to match by the abj model; may be that allocation to reproduction starts earlier than observed maturation, or that 1.72 mg per egg is overestimated';
D3 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PDJL'; % Cat of Life
metaData.links.id_ITIS = '556527'; % ITIS
metaData.links.id_EoL = '591177'; % Ency of Life
metaData.links.id_Wiki = 'Idiosepius_pygmaeus'; % Wikipedia
metaData.links.id_ADW = 'Idiosepius_pygmaeus'; % ADW
metaData.links.id_Taxo = '40208'; % Taxonomicon
metaData.links.id_WoRMS = '342345'; % WoRMS
metaData.links.id_molluscabase = '342345'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Idiosepius_pygmaeus}}';
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
bibkey = 'Jack1989'; type = 'Article'; bib = [ ... 
'author = {George David Jackson}, ' ... 
'year = {1989}, ' ...
'title = {THE USE OF STATOLITH MICROSTRUCTURES TO ANALYZE LIFE-HISITORY EVENTS IN THE SMALL TROPICAL CEPHALOPOD \emph{Idiosepius pygmaeus}}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {87(2)}, ' ...
'pages = {265--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LewiChoat1993'; type = 'Article'; bib = [ ... 
'author = {Andrew R. Lewis and j. Howard Choat}, ' ... 
'year = {1993}, ' ...
'title = {Spawning and Reproductive Output of the Tropical cephalopod \emph{Idiosepius pygmaeus}}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {50}, ' ...
'pages = {20--28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

