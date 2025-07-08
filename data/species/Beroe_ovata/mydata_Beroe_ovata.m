function [data, auxData, metaData, txtData, weights] = mydata_Beroe_ovata

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Nuda'; 
metaData.order      = 'Beroida'; 
metaData.family     = 'Beroidae';
metaData.species    = 'Beroe_ovata'; 
metaData.species_en = 'Comb jelly'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCin'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'L0'; 'Lp'; 'Li'; 'WC0'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'Wd-JO'; 'Ww-R_f'; 't-Ww'; 't-WC'; 'L-Ww'; 'Ww-JO_T'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2012 12 19];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2012 12 20];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2015 11 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 


%% set data
% zero-variate data

data.ab = 1;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnniFine2007';   
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'very unsure';
  
data.L0  = 0.083; units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = 'FineRoma2003';
data.Lp  = 1.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'FineRoma2003';
  comment.Lp = '12-13 mm';
data.Li  = 13.2;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'FineRoma2003';

data.WC0 = 1.28;  units.WC0 = 'mugC'; label.WC0 = 'initial egg carbon mass'; bibkey.WC0 = 'AnniFine2007';
data.Wwi = 112;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'FineRoma2003';

data.R7  = 5000;  units.R7  = '#/d'; label.R7  = 'reprod rate at 7 cm';     bibkey.R7  = 'FineRoma2006';   
  temp.R7 = C2K(25);  units.temp.R7 = 'K'; label.temp.R7 = 'temperature';
 
% uni-variate data

% dry weight - respiration data, 
data.WdJO = [ ...	dry mass (g), ml O2/h	
	0.01	0.003	
	0.019	0.005	
	0.02	0.006	
	0.03	0.007	
	0.039	0.019	
	0.04	0.008	
	0.06	0.022	
	0.111	0.022	
	0.15	0.05	
	0.154	0.058	
	0.168	0.046	
	0.351	0.099	
	0.445	0.151	
	0.686	0.253	
	0.991	0.273	
	1.191	0.526];
units.WdJO  = {'g', 'ml O2/h'};  label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO   = C2K(21);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'FineAnni2001';
comment.WdJO = 'from Sevastopol and neighbouring waters';

% wet weight - reproduction rate
WwRJX = [... % Ww (g), cum # eggs in 10 d, ration in %Ww per d
4.68    	 4007 108.3
10.7	 	 2066  97.7
17   	  	  4220  70.1
21.8	    2525   20.1	];
data.WwR = WwRJX(:,[1 2]); data.WwR(:,2) = data.WwR(:,2)/ 10; % convert cum # to rate
units.WwR  = {'g', '#/d'};  label.WwR = {'wet weight', 'reproduction rate'};  
temp.WwR   = C2K(21);  units.temp.WwR = 'K'; label.temp.WwR = 'temperature';
bibkey.WwR = 'FineAnni2001';
comment.WwR = 'from Sevastopol and neighbouring waters';

% time since birth - wet mass
data.tWw = [...	% time since birth (d),	Ww (mg)	
	1.795	0.031	
	1.795	0.023	
	1.88	0.017	
	4.615	0.025	
	4.786	0.032	
	4.872	0.045	
	8.803	0.827	
	8.889	0.257	
	11.795	3.76	
	11.88	4.875	
	11.966	6.6	
	14.872	28.751	
	14.872	6.6	
	14.957	55.03	
	19.829	62.66	
	19.915	30.022	
	19.915	21.236	
	22.735	88.587	
	22.821	229.563	
	22.906	55.03	
	28.803	878.232	
	28.803	353.893	
	28.803	201.61];
units.tWw   = {'d', 'mg'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(20.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'AnniFine2007';
comment.tWw = 'temp: 19-22 C';
%
% time since birth - organic carbon mass 
data.tWC = [ ...	time since birth, d	organic matter content	(maybe mug)
	2.632	2.222	
	2.632	1.848	
	4.649	2.362	
	4.825	1.965	
	4.825	1.445	
	8.86	13.594	
	8.86	7.134	
	11.754	47.863	
	11.842	37.44	
	14.737	49.355	
	15	173.78	
	15	123.975	
	20	120.226	
	20.088	184.785	
	20.088	96.977	
	23.07	436.516	
	23.07	229.087	
	23.07	173.78	
	23.07	149.05	
	29.123	558.042	
	29.211	386.071	
	29.298	940.445	];
units.tWC  = {'d', 'mug'};  label.tWC = {'time since birth', 'ashfree dry weight'};  
temp.tWC   = C2K(20.5);  units.temp.tWC = 'K'; label.temp.tWC = 'temperature';
bibkey.tWC = 'AnniFine2007';
comment.tWC = 'temp: 19-22 C';

% length - weight data
LWwA = [ ... %	length (mm), wet mass (mg)	(closed symbols: volume method)
	0.288	0.163	
	0.362	0.366	
	0.367	0.294	
	0.429	0.722	
	0.554	1.022	
	0.808	2.044	
	0.819	1.622	
	1.64	12.493];
% 			
LWwB = [ ... % length (mm), wet mass (mg) (open  symbols: weight method)
	0.739	1.483	
	1.757	11.566	
	1.882	14.204	
	2.072	16.784	
	2.6	17.669	
	2.654	24.99	
	3.151	59.071	
	5.537	148.889	];
data.LWw = [LWwA; LWwB]; % concatenate
units.LWw  = {'mm', 'mg'};  label.LWw = {'length', 'wet weight', 'AnniFine2007'};  
bibkey.LWw = 'AnniFine2007';
%
data.LWw2 = [ ...	% length, mm	Wet mass, mg	
	0.849	68.719	
	1.03	35.746	
	1.16	68.719	
	1.494	72.003	
	1.495	51.931	
	1.813	196.456	
	1.813	126.082	
	1.813	95.28	
	1.84	155.557	
	1.84	112.193	
	2.168	166.841	
	2.232	444.714	
	2.233	205.845	
	2.234	95.28	
	2.591	336.07	
	2.591	278.824	
	2.591	248.109	
	2.591	205.845	
	2.592	162.992	
	2.792	162.992	
	2.833	285.409	
	2.876	253.968	
	3.386	574.903	
	3.387	292.149	
	3.542	414.637	
	3.704	320.741	
	3.872	661.333	
	3.989	488.238	
	4.049	561.639	
	4.11	444.714	
	4.361	760.756	
	4.428	444.714	
	4.699	523.654	
	4.77	434.454	
	4.841	646.074	
	4.987	797.115	
	5.062	561.639	
	5.536	548.68	
	5.963	548.68	
	6.328	1030.467	
	6.329	602.379	
	6.423	743.204	
	6.424	692.939	
	6.519	1158.036	
	7.022	1332.133	
	7.794	1271.371	
	9.045	1158.036	
	10.188	1643.561	
	10.811	2811.578	
	10.975	1935.302	
	11.138	2501.855	
	11.826	1185.385	
	12.178	3015.525	
	12.545	3550.798	
	12.923	4380.908	
	14.562	2444.132	
	14.775	5663.404	
	14.777	4484.373	
	15.225	3550.798	
	16.647	3898.309	
	18.475	4484.373	
	18.75	5663.404	
	21.76	6217.673	
	22.42	5158.545	
	26.409	5532.736	
	28.023	9688.174	
	28.873	7671.25	
	31.099	11677.304	
	32.521	10636.341	
	38.873	19975.928	
	38.88	13750.094];
units.LWw2  = {'mm', 'mg'};  label.LWw2 = {'length', 'wet weight', 'SvetAbol2004'};  
bibkey.LWw2 = 'SvetAbol2004';

% wet weight - respiration data
data.WwJO_21 = [...  % wet mass (mg), 	mug O2/h	
	0.021	0.011	
	0.0211	0.004	
	0.0212	0.005	
	0.0213	0.007	
	0.0214	0.014	
	3.633	0.567	
	8.972	1.127	
	13.847	1.161	
	13.848	1.663	
	30.684	1.27	
	39.524	2.31	
	44.053	0.942	
	87.581	2.38	
	288.89	1.389	
	299.53	5.027	
	321.998	3.408	
	430.039	8.873	
	534.255	6.197	
	553.931	1.989	
	595.482	2.934	
	739.792	4.077	
	767.037	11.271	
	854.943	18.186	
	919.074	5.337	
	1101.247	6.385	
	1101.248	45.956	
	1141.804	14.751	
	1272.658	27.641	
	1368.124	11.613	
	1581.076	8.611	
	1639.304	37.276	
	1762.273	24.525	
	1894.466	12.703	
	2111.578	18.186	
	2440.25	    21.119	
	2440.251	54.987	
	2719.912	35.112	
	2820.081	11.271	
	3143.273	37.276	
	3503.503	23.803	
	3503.504	15.199	
	4679.042	103.036	
	5030.029	47.351	
	5407.346	60.148	
	6479.152	134.856	
	7221.686	83.575	
	7487.647	67.79	
	7763.404	161.359	
	8345.758	106.163	
	12423.406	211.191	
	14885.887	340.775	
	14885.888	176.503	
	16591.862	123.285	
	20612.751	446.016	
	21371.882	156.605	
	27528.999	193.07	
	28542.843	619.738	
	40979.371	941.946	
	49102.015	1093.858];
data.WwJO_21 = data.WwJO_21/ 1e3; % convert mg to g
units.WwJO_21  = {'g', 'mug O2/h'};  label.WwJO_21 = {'wet weight', 'O_2 consumption', '21 C'};  
temp.WwJO_21   = C2K(21);  units.temp.WwJO_21 = 'K'; label.temp.WwJO_21 = 'temperature';
bibkey.WwJO_21 = 'SvetAbol2004';
%
data.WwJO_26 = [...	wet mass (mg),	mug O2/h	
0.03	0.028
0.051	0.022
0.088	0.025
0.091	0.034
0.855	0.268
3.504	0.503
6.965	0.534
7.763	0.268
16.003	0.914
24.698	0.518
28.543	1.389
30.684	0.72
35.46	1.765
38.12	1.094
50.91	2.604
52.785	1.094
58.835	1.819
73.093	0.742
84.47	1.989
84.471	2.848
108.805	6.015
116.967	3.511
130.372	1.349
156.213	4.201
167.931	8.111
201.217	10.304
224.277	6.385
241.101	3.957
249.98	7.872
278.629	3.21
299.53	13.895
321.998	4.879
372.118	10.304
479.323	6.579
496.976	11.965
496.977	13.895
553.931	18.186
574.331	22.421
617.413	8.873
854.943	10.939
1227.454	38.407
1272.658	19.893
1272.659	30.236
2111.579	63.855
2923.941	123.285
3031.625	81.113
3503.505	161.359
4048.834	81.113
4352.548	224.207
4512.844	106.163
5215.279	161.359
7487.652	284.804
8049.321	224.207
10750.129	320.991
12423.413	245.251
19880.596	811.131
23821.189	914.195	];
data.WwJO_26 = data.WwJO_26/ 1e3; % convert mg to g
units.WwJO_26  = {'g', 'mug O2/h'};  label.WwJO_26 = {'wet weight', 'O_2 consumption', '26 C'};  
temp.WwJO_26   = C2K(26);  units.temp.WwJO_26 = 'K'; label.temp.WwJO_26 = 'temperature';
bibkey.WwJO_26 = 'SvetAbol2004';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWC = 0 * weights.tWC;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw','LWw2'}; subtitle1 = {'Data from AnniFine2007, SvetAbol2004'};
set2 = {'WwJO_26', 'WwJO_21'}; subtitle2 = {'SvetAbol2004 data at 26, 21 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'The data included in this entry are all taken in Black sea water with a salinity around 18, much lower than the typical 33 of sea water- it is an open question whether or not this affects  physiological performance';
D2 = 'Chemical pars are assumped to relate to ash-free dry mass; MaleFaga1993 report ash free dry mass over dry mass ratio of 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
D3 = 'Weights for tWC are set to zero because of uncertainty in the units and inconsistency with tWw';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Hermaphrodite';
metaData.bibkey.F1 = 'Wiki'; 
F2 = ['Invasive species in the black sea and used to control invasive populations of Mnemiopsis leidyi. ' ...
      'Lots of work done to see if _Beroe ovata_ should be released into the Caspian.'];
metaData.bibkey.F2 = 'doris'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5WJTR'; % Cat of Life
metaData.links.id_ITIS = '53956'; % ITIS
metaData.links.id_EoL = '45502754'; % Ency of Life
metaData.links.id_Wiki = 'Beroe_ovata'; % Wikipedia
metaData.links.id_ADW = 'Beroe_ovata'; % ADW
metaData.links.id_Taxo = '167447'; % Taxonomicon
metaData.links.id_WoRMS = '106362'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beroe_ovata}}';
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
bibkey = 'AnniFine2007'; type = 'Article'; bib = [ ... 
'author = {B. E. Anninsky and G. A. Finenko and G. I. Abolmasova and Z. A. Romanova}, ' ... 
'year = {2007}, ' ...
'title = {Somatic Organic Content of the Ctenophores \emph{Mnemiopsis leidyi} ({C}tenophora: {L}obata) and \emph{Beroe ovata} ({C}tenophora: {B}eroida) in Early Ontogenetic Stages}, ' ...
'journal = {Russian Journal of Marine Biology}, ' ...
'volume = {33}, ' ...
'number = {6}, '...
'pages = {417-424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FineAnni2001'; type = 'Article'; bib = [ ... 
'author = {G. A. Finenko and B. E. Anninsky and Z. A. Romanova and G. I. Abolmasova and A. E. Kideys}, ' ... 
'year = {2001}, ' ...
'title = {Chemical composition, repiration and feeding rates of the new alien ctenophore, \emph{Beroe ovata}, in the {B}lack {S}ea}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {451}, ' ...
'pages = {177//186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FineRoma2003'; type = 'Article'; bib = [ ... 
'author = {Finenko, G. A. and Romanova, Z. A. and Abolmasova, G. I. and Anninsky, B. E. and Svetlichny, L. S. and Hubareva, E. S. and Bat, L. and Kideys, A. E.}, ' ... 
'year = {2003}, ' ...
'title = {Population dynamics, ingestion, growth and reproduction rates of the invader Beroe ovata and its impact on plankton community in {S}evastopol {B}ay, the {B}lack {S}ea}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {25}, ' ...
'number = {5}, '...
'pages = {539-549}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FineRoma2006'; type = 'Article'; bib = [ ... 
'author = {Finenko, G. A. and Romanova, Z. A. and Abolmasova, G. I. and Anninsky, B. E. and Pavlovskaya, T. V. and Bat, L. and Kideys, A. E.}, ' ... 
'year = {2006}, ' ...
'title = {Ctenophores Invaders and Their Role in the Trophic Dynamics of the Planktonic Community in the Coastal Regions off the {C}rimean {C}oasts of the {B}lack {S}ea ({S}evastopol {B}ay)}, ' ...
'journal = {Oceanology}, ' ...
'volume = {46}, ' ...
'number = {4}, '...
'pages = {472-482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SvetAbol2004'; type = 'Article'; bib = [ ... 
'author = {Svetlichny, L. S. and Abolmasova, G. I. and Hubareva, E. S. and Finenko, G. A. and Bat, L. and Kideys, A. E.}, ' ... 
'year = {2004}, ' ...
'title = {Respiration rates of \emph{Beroe ovata} in the {B}lack {S}ea}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {145}, ' ...
'pages = {585-593}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'doris'; type = 'Misc'; bib = ...
'howpublished = {\url{http://doris.ffessm.fr/fiche2.asp?fiche_numero=1153}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplankton.}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Beroe_ovata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

