function [data, auxData, metaData, txtData, weights] = mydata_Xylonora_atlantica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Xylophagaidae';
metaData.species    = 'Xylonora_atlantica'; 
metaData.species_en = 'Atlantic woodeater'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiAb', 'jiHw'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj';'ap';'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-W'; 't-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011 

metaData.author   = {'Sylvie Gaudron'; 'Goncalo Marques'};    
metaData.date_subm = [2021 01 06];              
metaData.email    = {'sylvie.gaudron@sorbonne-universite.fr'};            
metaData.address  = {'UMR8187 LOG, Station Marine de Wimereux, 28 avenue Foch, B.P. 80, 62930 Wimereux France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 01 10]; 

%% set data
% zero-variate data
data.ah = 2 ; units.ah = 'd' ; label.ah = 'age at hatching' ; bibkey.ah = 'Culliney1976' ; 
  temp.ah = C2K(12) ; units.temp.ah = 'K' ; label.temp.ah = 'temperature' ; 
  comment.ah = '9-14 C; hatch is when gastrulation is completed (trochophora)';
data.ab = 25 ; units.ab = 'd' ; label.ab = 'age at birth' ; bibkey.ab = 'Culliney1976' ; 
  temp.ab =C2K(12); units.temp.ab = 'K' ; label.temp.ab = 'temperature' ; 
  comment.ab = 'between 11 and 13 C; birth is when trochophora transforms to umboveliger';
% birth take place after 25 days and there is 59 days of Pelagic Larval Dispersal(59-25=34d) to be pediveliger and then 7d to reach metamorphosis after settlement
data.tj = 31;    units.tj = 'd';    label.tj = 'time since birth at end of metamorphosis';     bibkey.tj = 'Romey1994';   
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
% Birth take place after 25 days and there is 59 days of PLD and maturity takes 74 days after settlement (74+59-25)
data.tp = 108;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'Romey1994';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '74 d after settlement';
data.am = 547;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Turner1973';  
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh  = 0.004;   units.Lh  = 'cm';   label.Lh  = 'length of trochophore';    bibkey.Lh  = 'Culliney1976';  
data.Lb = 0.0135; units.Lb = 'cm'; label.Lb = 'shell height of the umboveliger'; bibkey.Lb  = 'Culliney1976';
data.Lj = 0.035; units.Lj  = 'cm';   label.Lj  = 'shell height at the end of metamorphosis';    bibkey.Lj  = 'Culliney1976';
data.Lp  = 0.2;   units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'Gaud2019'; 
data.Li  = 1.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Turner1973';

data.Wwp = 0.004;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'GaudHaga2016';

data.Ri = 660*6/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'GaudHaga2016'; 
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  length.Ri = 0.398; units.length.Ri = 'cm'; label.length.Ri = 'shell height';

% uni-variate data
% time-length data
data.tL_1 = [ ...
41 68 131 276 313; 0.05 0.06 0.18 0.3 0.37]';  % cm, Shell height at f and T
units.tL_1   = {'d', 'cm'};  label.tL_1 = {'time since start of the colonization', 'shell height'};  
temp.tL_1    = C2K(11);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = 'Romey1994';
comment.tL_1 = 'Oak subtrate; temperature fluctuates from 5 C to 14 C (Cape Cod Continetal shelf)';
%
data.tL_2 = [ ...
 41	68 131	276 313;
 0.04	0.04	0.28	0.36 0.46]';  % cm, shell height 
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time since start of the colonization', 'shell height'};  
temp.tL_2    = C2K(11);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = 'Romey1994';
comment.tL_1 = 'Pine substrate; temperature fluctuates from 5 C to 14 C (Cape Cod Continetal shelf)';

% length-weight data 
data.LW = [ ... % shell height (micrometer), wet weight (mg) 
   3361	4008	3422	4493	3767	2662	4402	2907	2527	2399	2454	3301	1980	3498	3258	2928	2801	3328	2324	2370	2464	2685	1939	2004	2011	2672	2220	2695	2329	2410	1818	2601	2347	1420	2209	2377	1377	2455	1821	1891	2114	1588	2073	1351	2608	1148	1020	1442	2358	2712	3994	3550	3108	2420	3451	3361	3569	2511	2565	2488	2743	3086	2869	2353	2207	2416	3038	2001	2381	4290	4419	3723	3349	4005	3271	3621	4417	2816	3315	4129	4206	4383	3703	4250	3211	3744	2853	2958	2584	2801	3061	3509	3569	3683	3052	3707	4141	3997	3309	3593	4181	3656	3477	2233	3352	2307	3549	4114	3238	3117	2762	2645	2778	3507	2892	3883	3496	2691	3124	3416	2916	3784	3367	3630	2570	3123	3086	2743	3786	2518	3191	2971	2781	2773	2620	3332	3294	3575	3207	2779	2717	2492	2360	2384	2243	2504	3194	3026	2905	2915	3755	2473	2937	2543	2852	2492	2040	3199	2504	2953	3235	3140	2405	2274	2811	2402	2181	2366	3174	2500	2247	2137	2470	2702	2084	2419	2427	2947	2951	2418	3066	2390	2624	2613	2435	2166	2356	1914	2197	2943	2711	2386	2808	2813	2547	2520	2301	2276	2596	2125	2740	2821	2235	2310	3080	2940	2076	2088	2026	2491	2240	2500	2483	2467	2562	1963	3254	3003	2611	2229	2962	1997	1931	2028	2555	2530	2359	2917	2336	2120	2753	1971	2813	2603	3210	1906	2759	1596	2303	2399	1947	2462	2689	2247	1961	2572	2157	2418	2210	2680	1585	3218	1688	1932	2260	2104	2407	2043	1836	1737	1969	1887	1758	1925	1827	1976	2186	1792	2137	2207	1750	3075	2717	2254	2156	2949	1864	2106	2681	2427	2227	2787	2631	2423	2024	3056	2108	3512	2166	2177	2329	2503	3000	1906	1993	1939	2595	3094	2953	2806	2152	2437	2913	2410	2459	1755	2298	2172	2505	1851	2259	4049	2410	2906	2446	3417	4072	1843	3261	3664	2897	2984	3608	2692	2418	2039	3534	2415	2202	2601	2509	1978	2399;
20	35	20	36	35	12	42	14	8	7	9	19	4	23	16	12	13	19	8	8	8	10	4	6	4	10	5	9	6	6	3	8	7	1	5	7	2	4	3	3	5	2	6	1	9	1	0	1	5	8	25	21	11	7	23	16	24	6	8	7	8	10	8	6	4	5	14	3	4	31	41	24	20	19	17	29	34	13	19	31	27	37	21	44	15	26	14	15	8	7	18	23	26	28	17	28	39	33	18	30	35	25	15	8	21	6	18	33	18	15	12	9	13	17	13	23	23	11	16	24	17	20	22	15	9	17	13	13	14	10	21	11	11	12	9	14	18	27	17	13	12	9	7	20	5	8	16	14	12	13	14	10	15	9	11	9	4	18	6	9	12	15	8	6	11	6	4	8	15	5	5	6	11	11	6	7	7	13	12	6	15	8	10	10	6	5	7	3	6	14	10	6	11	8	8	8	6	4	9	6	11	8	5	7	10	12	4	3	4	9	6	5	8	6	7	4	13	15	10	7	13	3	3	5	6	9	3	12	5	5	9	4	7	7	12	5	9	2	6	6	4	6	10	6	4	8	6	4	5	10	2	13	2	3	7	5	7	5	2	2	3	3	2	3	3	4	5	3	4	4	2	11	7	4	4	9	4	5	9	8	5	10	10	10	5	11	4	12	7	5	5	7	8	4	4	4	6	15	10	9	4	7	8	7	8	4	4	4	10	3	4	21	8	10	8	20	28	4	16	18	14	14	22	10	9	4	16	9	5	10	10	4	10]';
data.LW(:,1) = data.LW(:,1)/ 10000; % convert mum to cm
data.LW(:,2) = data.LW(:,2)/ 1000; % convert mg to g  
units.LW = {'cm', 'g'};     label.LW = {'shell height', 'wet weight'};  
bibkey.LW = 'GaudHaga2016';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_2','tL_1'}; subtitle1 = {'Substrate: pine, oak'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '7TNLP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '59190355'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Xylophaga_atlantica'; % ADW
metaData.links.id_Taxo = '5738573'; % Taxonomicon
metaData.links.id_WoRMS = '1472292'; % WoRMS
metaData.links.id_molluscabase = '1472292'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/my_pet}}';
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
bibkey = 'Culliney1976'; type = 'Article'; bib = [ ... 
'author = {Culliney, J. L. and Turner, R.D.}, ' ... 
'year = {1976}, ' ...
'title = {Larval development of the deep-water wood boring bivalve,\emph{Xylophaga atlantica} {R}ichards ({M}ollusca, {B}ivalvia, {P}holadidae}, ' ...
'journal = {Ophelia}, ' ...
'volume = {15}, ' ...
'number = {2}, '...
'doi = {10.1080/00785326.1976.10425455}, '...
'pages = {149-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaudHaga2016'; type = 'Article'; bib = [ ... 
'author = {Gaudron, S. M. and Haga, T. and Wang, H. and Laming, S. R. and Duperron, S.}, ' ... 
'year = {2016}, ' ...
'title = {Plasticity in reproduction and nutrition in wood-boring bivalves (\emph{Xylophaga atlantica}) from the {M}id-{A}tlantic {R}idge}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {163}, ' ...
'number = {e213}, '...
'doi = {10.1007/s00227-016-2988-6}, '...
'pages = {1-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Turner1973'; type = 'Article'; bib = [ ... 
'author = {Turner, R.D.}, ' ... 
'year = {1973}, ' ...
'title = {Wood-boring bivalves, opportunistic species in the deep sea}, ' ...
'journal = {Science}, ' ...
'volume = {180}, ' ...
'number = {2}, '...
'doi = {}, '...
'pages = {1377-1379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Romey1994'; type = 'Article'; bib = [ ... 
'author = {Culliney, J. L. and Turner, R. D.}, ' ... 
'year = {1994}, ' ...
'title = {Rapid growth of a deep-sea wood-boring bivalve}, ' ...
'journal = {Continental Shelf Research}, ' ...
'volume = {14}, ' ...
'number = {12}, '...
'doi = {}, '...
'pages = {1349-1359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gaud2019'; type = 'Misc'; bib = [ ...
'author = {Gaudron, S. M}, ' ... 
'year = {2019}, ' ...
'note = {unpublished results from own research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];




