function [data, auxData, metaData, txtData, weights] = mydata_Pelobates_syriacus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelobatidae';
metaData.species    = 'Pelobates_syriacus'; 
metaData.species_en = 'Eastern spadefoot'; 

metaData.ecoCode.climate = {'Csa', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTi', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 10 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 120;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3.2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'CogaRosi2014';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.5*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'CogaRosi2014';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'CogaRosi2014';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 2.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'CogaRosi2014'; 
data.Lp  = 6.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'CogaRosi2014';
data.Lpm  = 6.2; units.Lpm  = 'cm'; label.Lpm = 'SVL at puberty for males';   bibkey.Lpm  = 'CogaRosi2014';
data.Li  = 10.6; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'CogaRosi2014';
data.Lim = 9.3;    units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';   bibkey.Lim  = 'CogaRosi2014';

data.Wwb = 2.3e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwp = 40;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'CogaRosi2014';
data.Wwpm = 25.8;units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'CogaRosi2014';
data.Wwi = 120; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'CogaRosi2014';
data.Wwim = 90;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'CogaRosi2014';

data.Ri  = 6000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri  = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'rough estimate';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
2.973	5.975
3.993	5.707
4.487	5.573
4.954	7.763
5.014	5.719
5.974	7.174
5.990	7.401
6.500	7.214
6.517	7.374
6.551	8.523
6.996	7.681
6.997	8.495
6.998	8.963
7.011	7.240
7.027	7.560
7.491	7.814
7.502	5.543
7.503	6.037
7.509	8.855
7.965	5.756
7.966	6.357
7.987	8.988
8.016	7.546
8.464	8.066
8.956	6.650
8.975	8.280
8.975	8.533
8.976	8.640
9.481	5.982
11.493	7.369
12.009	9.946];
data.tL_f(:,1) = data.tL_f(:,1)  * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CogaRosi2014';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.433	4.228
0.434	4.495
0.448	3.534
0.449	3.961
0.463	3.614
0.464	3.868
0.465	4.055
1.501	3.960
1.502	4.321
3.979	6.615
4.954	7.482
4.956	8.871
4.998	5.933
5.000	6.628
5.974	7.268
5.976	8.256
6.487	8.336
6.533	7.574
6.995	7.841
6.996	7.921
6.997	8.282
6.998	8.816
7.503	5.971
7.985	8.014
7.986	8.254
7.987	9.175
7.988	9.402
7.999	6.397
8.000	6.544
8.001	6.625
8.002	7.693
8.013	6.104
8.014	6.197
8.482	9.242
8.976	8.974
8.977	9.081
8.989	7.492
9.006	7.986
9.007	8.066
9.486	8.626
9.499	7.358
10.502	5.981];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'CogaRosi2014';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % SVL (cm) wet weight (g)
5.533	19.424
5.568	21.705
5.630	25.254
5.674	27.282
5.745	25.262
5.825	24.761
5.923	23.756
5.948	48.821
6.028	30.852
6.338	39.988
6.488	44.050
6.568	43.549
6.630	42.288
7.161	63.845
7.197	43.848
7.233	45.623
7.330	51.199
7.356	57.277
7.488	64.375
7.532	68.429
7.647	75.020
7.658	36.033
7.702	46.922
7.728	54.772
7.738	40.849
7.789	77.562
8.036	89.731
8.240	93.544
8.453	76.597
8.470	88.497
8.507	76.854
8.507	62.424
8.604	78.380
8.773	74.595
8.816	84.724
8.922	93.087
8.939	103.214
9.922	119.235];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL','wet weight','female'};  
bibkey.LW_f = 'CogaRosi2014';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (cm) wet weight (g)
5.920	23.080
5.937	23.841
5.946	21.812
6.043	27.391
6.071	21.812
6.159	25.616
6.275	26.123
6.435	24.094
6.549	30.688
6.550	27.138
6.602	35.507
7.241	43.623
7.320	44.384
7.336	65.181
7.436	47.681
7.454	43.623
7.534	41.594
7.639	52.754
7.843	55.290
7.879	56.812
7.940	58.841
7.950	51.486
8.020	61.884
8.020	58.080
8.198	57.319
8.224	66.196
8.225	59.855
8.269	63.406
8.314	58.587
8.612	83.442
8.809	76.341
8.836	69.239
8.934	67.210
9.030	86.232
9.101	83.949
9.145	84.203
9.216	85.217
9.358	92.319];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL','wet weight', 'male'};  
bibkey.LW_m = 'CogaRosi2014';
comment.LW_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D3',D3);  


%% Links
metaData.links.id_CoL = '76CZJ'; % Cat of Life
metaData.links.id_ITIS = '664731'; % ITIS
metaData.links.id_EoL = '1048335'; % Ency of Life
metaData.links.id_Wiki = 'Pelobates_syriacus'; % Wikipedia
metaData.links.id_ADW = 'Pelobates_syriacus'; % ADW
metaData.links.id_Taxo = '47558'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelobates+syriacus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelobates_syriacus}}';
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
bibkey = 'CogaRosi2014'; type = 'Article'; bib = [ ... 
'author = {D. Cogalniceanu and D. Rosioru and P. Szekely and D. Szekely and E. Buhaciuc and F. Stanescu and C. Miaud}, ' ... 
'year = {2014}, ' ...
'title = {Age and Body Size in Populations of Two Syntopic Spadefoot Toads (Genus \emph{Pelobates}) at the Limit of Their Ranges}, ' ...
'journal = {Journal of Herpetology}, ' ...
'number = {4}, ' ...
'volume = {48}, ' ...
'pages = {537-545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Pelobates&where-species=syriacus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
