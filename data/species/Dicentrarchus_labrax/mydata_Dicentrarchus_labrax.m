function [data, auxData, metaData, txtData, weights] = mydata_Dicentrarchus_labrax 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Moroniformes'; 
metaData.family     = 'Moronidae';
metaData.species    = 'Dicentrarchus_labrax'; 
metaData.species_en = 'European seabass'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ah_T'; 'ab_T'; 'aj'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww_T'; 'Ww-R'; 'Ww-JX_T'; 'T-JN_W'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2012 07 20];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 30];              
metaData.email_mod_1  = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Orestis Stavrakidis Zachou'};    
metaData.date_mod_2 = [2018 05 10];              
metaData.email_mod_2    = {'ostavrak@hcmr.gr'};            
metaData.address_mod_2  = {'Hellenic Center for Marine Research'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 05 11]; 

%% set data
% zero-variate data

data.ah_15 = 3.6;    units.ah_15 = 'd';   label.ah_15 = 'age at hatch';           bibkey.ah_15 = 'LikaKooy2014';   
  temp.ah_15 = C2K(15); units.temp.ah_15 = 'K'; label.temp.ah_15 = 'temperature';
data.ah_17 = 2.9;    units.ah_17 = 'd';   label.ah_17 = 'age at hatch';           bibkey.ah_17 = 'Papa2012';   
  temp.ah_17 = C2K(17); units.temp.ah_17 = 'K'; label.temp.ah_17 = 'temperature'; 
data.tb_16 = 9;      units.tb_16 = 'd';   label.tb_16 = 'time since hatch at birth'; bibkey.tb_16 = 'Papa2012';   
  temp.tb_16 = C2K(16); units.temp.tb_16 = 'K'; label.temp.tb_16 = 'temperature';
data.tb_19 = 7;      units.tb_19 = 'd';   label.tb_19 = 'time since hatch at birth'; bibkey.tb_19 = 'LikaKooy2014';   
  temp.tb_19 = C2K(19); units.temp.tb_19 = 'K'; label.temp.tb_19 = 'temperature';
data.tj = 70;        units.tj = 'd';      label.tj = 'time since hatch at metam';  bibkey.tj = 'LikaKooy2014';
  temp.tj = C2K(19); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'this stage (metamorphosis) corresponds to the completeness of metamorhosis';
data.am = 15 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.35;     units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'LikaKooy2014';  
data.Lb  = 0.55;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'LikaKooy2014';  
data.Lj  = 4.0;      units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'LikaKooy2014';  
data.Li  = 103;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.3e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
data.Wwp = 700;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Anon2008';
data.Wwi = 1e4;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
 
% uni-variate data
% time day since hatch, length (mm)
tLength1 =[1	2	3	4	5	6	7	8	9	10	13	13.1	14	14.1	15	15.1	16	16.1	17	17.1	20	20.1	...
    21	21.1	22	22.1	23	23.1	24	24.1	27	27.1	28	28.1	29	29.1	30	30.1	31	31.1	35	35.1	36	36.1	...
    37	37.1	38	38.1	39	39.1	39.2	40	41	41.1	42	42.1	43	43.1	44	44.1	45	45.1	48	48.1	49	49.1	...
    50	50.1	51	51.1	52	52.1    57;
    3.59	4.40	4.82	5.16	5.31	5.17	5.43	5.45	5.44	6.16	5.50	...
    5.31	5.78	5.48	6.03	6.00	5.98	5.98	6.67	6.43	8.43	8.07	...
    7.52	8.18	8.50	7.92	8.43	8.23	9.66	6.38	10.54	9.43	10.78	...
    11.18	11.87	10.28	11.36	12.49	12.96	12.49	15.40	14.27	13.40	12.65	...
    13.38	12.45	15.70	12.79	16.34	15.64	12.50	15.31	17.51	11.33	16.61	...
    16.39	17.79	16.78	17.31	15.99	18.86	17.89	18.19	15.99	18.14	18.24	...
    18.79	17.30	20.36	16.93	17.94	18.12   20.10;
    19.2 18.6 18.2 18.4 18.8 18.9 18.6 18 17.9 18.6 19.1 19.1 18.9 18.9 18.7 18.7 18.6 18.6 18.6 18.6 19 19 ...
    18.9 18.9 18.9 18.9 18.9 18.9 18.9 18.9 18.4 18.4 18.7 18.7 19 19 19.1 19.1 19.2 19.2 19.1 19.1 18.9 18.9 ...
    18.7 18.7 18.8 18.8 18.9 18.9 18.9 19.3 19.9 19.9 19.6 19.6 19.4 19.4 19.4 19.4 19.5 19.5 19.7 19.7 19.4 19.4 ...
    19.3 19.3 19.4 19.4 19.4 19.4 19.4]';
data.tL_larv=tLength1(:, [1 2]); 
data.tL_larv(:,2) = data.tL_larv(:,2)/ 10;       % convert mm to cm
units.tL_larv   = {'d', 'cm'};  label.tL_larv = {'time since hatch', 'total length'};  
temp.tL_larv    = C2K(19);  units.temp.tL_larv = 'K'; label.temp.tL_larv = 'temperature';
bibkey.tL_larv  = 'LikaPavl2015';
comment.tL_larv = 'Rearing in 2 m^3 tanks; temp 19 +/- 1C';
%
tL_larv_SD =[0.1510	0.1066	0.3988	0.1755	0.1225	0.1578	0.1305	0.2195	0.3082	0.6295	0.1142 ...
    0.2936	0.2595	0.3556	0.4409	0.5063	0.4390	0.3762	0.2947	0.5893	0.3575	0.3653	0.4785	...
    0.6663	0.4517	0.6815	0.7969	0.9945	1.0023	1.3734	0.6546	1.3519	1.5136	1.8074	1.4230	...
    1.8024	0.9399	0.9240	1.3461	1.3203	1.8629	1.2503	1.0698	1.7140	1.3866	0.6460	1.4207	...
    1.2832	1.0785	1.0536	1.6041	1.1017	1.7346	0.4457	1.4074	1.9044	0.8726	0.8028	1.2566	...
    1.5598	1.2254	2.0416	2.1346	2.0129	1.4940	0.9408	1.5645	1.5803	1.6683	1.7996	2.0426	2.2451	2.4000]';
tL_larv_SD =tL_larv_SD/10; % convert mm to cm, standard deviation of the measurements
%
% time day since hatch, wet weight (g)
tWeight1 = [10 15	15.1	20	20.1	28	28.1	31	31.1	42	42.1	45	45.1	50	50.1 65 65.1 93 100;
    0.00043    0.000759	0.000760	0.001965	0.002074	0.004354	...
    0.004920	0.007532	0.007029	0.024197	0.020263	0.037254	...
    0.029938	0.042103	0.030228 0.29 0.17 0.90 1.23;
    18.6 18.7 18.7 19 19 18.7 18.7 19.1 19.1 19.6 19.6 19.5 19.5 19.3 19.3 19.5 19.5 19.5 19.5]';
data.tWw_larv= tWeight1(:,[1 2]);
units.tWw_larv   = {'d', 'g'};  label.tWw_larv = {'time since hatch', 'wet weight'};  
temp.tWw_larv    = C2K(tWeight1(:,3));  units.temp.tWw_larv = 'K'; label.temp.tWw_larv = 'temperature';
bibkey.tWw_larv  = 'LikaPavl2015';
comment.tWw_larv = 'Rearing in 2 m^3 tanks; temp 19 +/- 1C';

% time since hatch, d; wet weight g; temperature C
F2_M_0708 = [122	138	156	172	187	202	217	233	248	263	278	294	309	324	339	352	367	383	398	413	428	444	459	474	489	505	520	536	551	566	597	627	658;
    3 9.4 13.9	19	25.1 34.6 43.6 61.1	70.9 82	101.8 114.8	120	127.8 134 134.6	141	141	149	148.7 162 162.3	186	185.9 227 227.2	248	248.5 276	298	343	381	401;
    23.6 23.8 23.7 23.5	23.1 23.1 21.8 21.8	19.6 19.6 17.7 17.7	16.1 16.1 14.9 14.9	14.2 14.2 14.2 14.2	15.2 15.2 17.1 17.1	19.3 19.3 21.7 21.7	22.3 22.3 21.7 19.3	17.7]';
data.tWw = F2_M_0708(:, [1 2]); 
units.tWw   = {'d', 'g'};  label.tWw = {'time since hatch', 'wet weight'};  
temp.tWw = C2K(F2_M_0708(:, 3)); 
units.temp.tWw   = {'K'};  label.temp.tWw   = {'temperature'};
treat.tWw = {0}; units.treat.tWw = ''; label.treat.tWw = '';
bibkey.tWw  = 'PapaLika2014';
comment.tWw = 'Farm 2, Mesocosm, year 2007-2008; dynamic temperature is used';
%
% Fecundity (Mayer et al, 1990 table 1)
% Absolute Fecundity (eggs per year), weight (g) at Plymouth and Gower
FWN = [
    3800 2043126;
    2650 1390023;
    2350 949094;
    2000 971933;
    2000 734121;
    1400 621799;
    2250 1049027;
    1241 552512; 
    1000 412789;
    1200 449434;
    1225 559513; 
    1175 457567;
    1065 290390;
    1060 360014;
    1390 612153; 
    1320 585000];
FWN(:,2)=FWN(:,2)./365; % convert #eggs/year to #eggs/day 
data.WwR = FWN(:,[1 2]);
units.WwR   = {'g', '#/d'};  label.WwR = {'wet weight','reproduction rate'};  
temp.WwR    = C2K(13); units.temp.WwR = 'K'; label.temp.WwR = 'temperature';
comment.WwR = 'Mean annual sea temp of last 100 years (seatemperature.org) for Plymouth=12.9 C';
bibkey.WwR  = 'MayeShac1990';

%  wet weight, g, total ammonia nitrogen excretion rate, mg N/Kg/d, temp in C  (Person et al. 2004, Fig 3A) 
WJNT = [ ...
    108.4 168.89 13;
    123.5 215.07 16;
    144.3 244.90 19;
    159.8 385.71 22; 
    177.5 453.82 25;
    177.7 416.24 29];
WJNT =[data.Wwi-0.0001 0.05*max(WJNT(:,2)) 7; WJNT; data.Wwi 0.05*max(WJNT(:,2)) 33];
WJNT(:,2) = 1e-6 * WJNT(:,2);  % convert to g N/g/d
data.TJN = WJNT(:,[3 2]); 
units.TJN   = {'C', 'g/d.g'};  label.TJN = {'temperature', 'NH3 production'};  
weight.TJN =  WJNT(:,1); units.weight.TJN = {'g'};  label.weight.TJN = {'wet weight'}; 
treat.TJN = {0}; units.treat.TJN = ''; label.treat.TJN = '';
bibkey.TJN = 'PersMahe2004';
comment.TJN = 'We assume near-zero values (5 percent of the maximum value) at the upper temperatures of the positive rate range known from literature (280-306K). These data are used as pseudo-data to increase identifiability of the  temperature parameters';

% Wet weight (g), feed intake (g/d) per fish, temperature C. 
Feed_Z = [275 319.5 378 427.5 489 552 589.5 590.5 572.5 563.5 559 572.501;    % Average weight
    5.84 8.97 9.63 9.32 6.28 5.71 3.29 3.68 3 6.41 6.03 8.88;                 % Feed
    20.35 22.10 24.48 22.17 20.34 16.54 13.75 12.70 13.50 15.23 18.75 23.90]';% Temp
data.WwJX_T = Feed_Z(1:7,[1 2]); % exclude data during spawning
units.WwJX_T   = {'g', 'g/d'};  label.WwJX_T = {'wet weight','feed intake'};  
temp.WwJX_T    = C2K(Feed_Z(1:7,3)); units.temp.WwJX_T = 'K'; label.temp.WwJX_T = 'temperature';
treat.WwJX_T = {0}; units.treat.WwJX_T = ''; label.treat.WwJX_T = '';
bibkey.WwJX_T  = 'Zanu1985';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.tL_larv = 5* weights.tL_larv;
weights.TJN(1) =0.1* weights.TJN(1); % treat the first and last values as pseudo data
weights.TJN(8) =0.1* weights.TJN(8); % treat the first and last values as pseudo data

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points

D1 = 'version 20180511: addition of feeding data (dataset: WwJX_T, Zanu1985). The conversion efficiency of food into assimilated energy was fixed to the value 0.68, Lupa2001';    
D2 = 'version 20180511: The conversion efficiency of food into assimilated energy was fixed to the value 0.68, Lupa2001';
D3 = 'version 20161030: used three datasets for reproduction: WN_9, WN_11 (MayeShac1990) and WN_17 (unpublished).';
D4 = 'version 20180511: datasets WN_9 and WN_11 (MayeShac1990) were unified into WwR. The mean annual SST of the last 100 years (seatemperature.org) for Plymouth was used. WN_17 were excluded due to uncertainty of the rearing conditions and prevelence of outliers.';    
D5 = 'version 20161030: used various data sets for length and weight during larvae development and during on-growing phase.';
D6 = 'version 20180511: One dataset was used for the length and weight (tL_larv, tWw_larv). The rest were kept for validation purposes';
D7 = 'version 20180511: The datasets using intensive hatchery methology were found to be conflicting with the mesocosm methodology and were excluded';
D8 = 'version 20180511: Temperature correction uses the extended Arrhenius equation for deactivation rates at T_L and T_H. The five temperature parameters were estimated from the data';    
D9 = 'version 20180511: Pseudo-data were added to the PersMahe2004 dataset to increase identifiability of the temperature parameters';
D10 = 'version 20180511: E_G was fixed to the value 5230, assuming kap_G=0.8. This was done on the basis that kap_G has a high weight coefficient.';    
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7, 'D8',D8, 'D9',D9, 'D10',D10);

%% Facts
F1 = 'version 20180511 of this entry is discussed in StavPapa2018';
metaData.bibkey.F1 = 'StavPapa2018';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35J92'; % Cat of Life
metaData.links.id_ITIS = '170317'; % ITIS
metaData.links.id_EoL = '46578724'; % Ency of Life
metaData.links.id_Wiki = 'Dicentrarchus_labrax'; % Wikipedia
metaData.links.id_ADW = 'Dicentrarchus_labrax'; % ADW
metaData.links.id_Taxo = '173131'; % Taxonomicon
metaData.links.id_WoRMS = '126975'; % WoRMS
metaData.links.id_fishbase = 'Dicentrarchus-labrax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicentrarchus_labrax}}';
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
bibkey = 'Anon2008'; type = 'Misc'; bib = [ ... 
'author = {Anonimous}, ' ... 
'year = {2008}, ' ...
'title = {Scientific report of EFSA prepared by Working Group on seabass/seabream welfare on Animal Welfare Aspects of Husbandry Systems for Farmed {E}uropean seabass and gilthead seabream.}, ' ...
'journal = {Annex I to The EFSA Journal}, ' ...
'volume = {844}, ' ...
'pages = {1--89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MayeShac1990'; type = 'Article'; bib = [ ... 
'author = {I. MAYER and S.E. SHACKLEY and P.R. WITTHAMES}, ' ... 
'year = {1990}, ' ...
'title = {Aspects of the reproductive biology of the bass, \emph{Dicentrarchus labrax} {L}. 11. {F}ecundity and pattern of oocyte development}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {36}, ' ...
'pages = {141--148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PersMahe2004'; type = 'Article'; bib = [ ... 
'author = {J. Person-Le Ruyet and K. Mahe and N. Le Bayon and H. Le Delliou}, ' ... 
'year = {2004}, ' ...
'title = {Effects of temperature on growth and metabolism in a Mediterranean population of {E}uropean sea bass, \emph{Dicentrarchus labrax}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {237}, ' ...
'pages = {269--280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StavPapa2018'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.seares.2018.05.008}, ' ...
'author = {O. Stavrakidis-Zachou and N. Papandroulakis and K. Lika}, ' ... 
'year = {2004}, ' ...
'title = {A {DEB} model for European sea bass (\textit{Dicentrarchus labrax}): parameterisation and application in aquaculture}, ' ...
'journal = {J. Sea Research}, ' ...
'volume = {143}, ' ...
'pages = {262-271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zanu1985'; type = 'Article'; bib = [ ... 
'author = {Zanuy, S. and Carrillo, M.}, ' ... 
'year = {1985}, ' ...
'title = {Annual cycles of growth, feeding rate, gross conversion efficiency and hematocrit levels of sea bass (\emph{Dicentrarchus labrax}) adapted to two different osmotic media}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {44}, ' ...
'pages = {11--25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lupa2001'; type = 'Article'; bib = [ ... 
'author = {Lupatsch, I. and Kissil, G. and Sklan, D.}, ' ... 
'year = {2001}, ' ...
'title = {Optimization of feeding regimes for European sea bass (\emph{Dicentrarchus labrax}): a factorial approach}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {202}, ' ...
'pages = {289-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PapaLika2014'; type = 'Article'; bib = [ ... 
'author = {Papandroulakis, N. and Lika, K. and Kristiansen, T.~S. and Oppedal, F. and Divanach, P. and Pavlidis, M.}, ' ... 
'year = {2014}, ' ...
'title = {Behaviour of European sea bass, \emph{Dicentrarchus labrax} {L}., in cages - impact of early life rearing conditions and management.}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {49}, ' ...
'pages = {1545-1558}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'LikaPavl2015'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Pavlidis, M. and Mitrizakis, N. and Samaras, A. and Papandroulakis, N.}, ' ... 
'year = {2015}, ' ...
'title = {Do experimental units of different scale affect the biological performance of European sea bass \emph{Dicentrarchus labrax} larvae?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {86}, ' ...
'pages = {1271-1285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S. A. L.~M. and Papandroulakis, N}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in Mediterranean Perciformes}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {94}, ' ...
'pages = {37-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%   
bibkey = 'Papa2012'; type = 'Misc'; bib = [ ...
'author = {Papandroulakis}, ' ...
'year = {2012}, ' ...
'note = {pers. com}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
