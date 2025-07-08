  function [data, auxData, metaData, txtData, weights] = mydata_Acanthophis_antarcticus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Acanthophis_antarcticus'; 
metaData.species_en = 'Common death adder'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 16]; 

%% set data
% zero-variate data
data.am = 9.3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 15;      units.Lb = 'cm';     label.Lb = 'total length at birth';  bibkey.Lb = 'John1987';
data.Lp = 30;     units.Lp = 'cm';     label.Lp = 'total length at puberty for females'; bibkey.Lp = 'John1987'; 
data.Lpm = 44;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'John1987'; 
data.Li = 100;     units.Li = 'cm';     label.Li = 'ultimate total length for females';  bibkey.Li = 'John1987';

data.Wwb = 5.84;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'John1987';

data.Ri = 20.4/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'John1987';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20.4 eggs per clutch in captivity, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
0.000	18.779
0.000	17.103
2.560	9.352
3.413	15.223
3.913	13.337
94.096	18.498
95.894	20.807
96.227	19.550
183.093	19.045
183.891	25.126
184.335	23.450
184.724	21.983
185.057	20.725
306.847	33.898
308.013	29.497
309.866	31.596
311.699	24.681
453.123	27.400
453.401	26.352
454.719	39.561
455.406	46.061
456.016	43.756
458.516	34.326
459.849	29.296
543.529	31.722
545.215	34.450
546.235	39.693
546.680	38.016
674.083	57.277
676.936	55.604
795.868	43.196
797.463	55.357
798.796	50.328
799.074	49.280
799.629	47.184
800.240	44.879
803.280	51.592
882.699	51.916
885.587	41.018
886.218	47.728
888.328	39.765
891.812	44.801
892.423	42.496
998.096	61.935
998.374	60.887
1002.136	64.876
1003.580	59.427
1004.302	56.703
1157.990	58.600
1162.898	49.173
1244.856	58.096
1245.190	56.839
1380.152	74.852
1381.040	71.499];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'John1987';

% time - weight
data.tW = [ ... % time since birth (d), weight (g)
0	6.871
0	6.479
0	5.432
0	4.973
0	4.294
0	8.196
0	7.287
0	6.110
1.989	1.018
92.511	10.097
96.274	8.978
98.311	13.547
98.599	12.405
181.787	18.490
182.170	16.440
186.508	12.256
186.700	11.557
186.844	11.058
187.419	9.271
187.755	8.365
189.265	14.837
308.954	27.196
311.327	37.028
311.614	33.904
311.806	31.969
316.863	19.120
459.081	139.545
459.465	124.073
461.574	65.007
462.269	18.648
462.916	43.085
463.395	37.198
464.306	28.139
554.636	37.301
556.194	65.193
557.081	139.959
560.652	131.985
671.210	177.658
674.206	199.834
787.760	302.561
788.095	272.994
788.335	253.661
788.958	209.563
789.341	186.327
876.580	226.134
880.343	201.081
881.901	351.441
882.044	336.289
885.088	372.749
886.143	269.810
1001.422	240.727
1001.950	204.808
1005.880	487.360
1006.072	459.547
1006.551	396.763
1007.510	295.755
1151.238	482.364
1158.907	364.960
1222.107	497.812
1223.497	325.123
1370.940	478.492
1371.659	383.863];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'John1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8Z4D'; % Cat of Life
metaData.links.id_ITIS = '700433'; % ITIS
metaData.links.id_EoL = '452875'; % Ency of Life
metaData.links.id_Wiki = 'Acanthophis_antarcticus'; % Wikipedia
metaData.links.id_ADW = 'Acanthophis_antarcticus'; % ADW
metaData.links.id_Taxo = '50195'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Acanthophis&species=antarcticus'; % ReptileDB
metaData.links.id_AnAge = 'Acanthophis_antarcticus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthophis_antarcticus}}';
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
bibkey = 'John1987'; type = 'Article'; bib = [ ...  
'author = {G. R. Johnston}, ' ...
'year = {1987}, ' ...
'title = {Reproduction and growth in captive death adders \emph{Acanthophis antarcticus} ({S}quamata: {E}lapidae)}, ' ... 
'journal = {Trans. Roy. Soc. S. Aust.}, ' ...
'volume = {111}, '...
'pages = {123-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Acanthophis_antarcticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


