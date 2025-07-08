function [data, auxData, metaData, txtData, weights] = mydata_Lamellidens_marginalis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Lamellidens_marginalis'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'; 'W0-Wwt'; 'L-Ww'; 'L-Wd'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 12]; 

%% set data
% zero-variate data

data.am = 25*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 10.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NahaIsla2019';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';

data.Ri  = 4.5e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';

% uni-variate data

% initial length - length after 120 d
data.LL  = [ ... % shell length (cm), shell length after 120 d (cm)
    5.59 5.92
    5.01 5.19
    4.93 5.12];
units.LL   = {'cm', 'cm'};  label.LL = {'shell length', 'shell length after 120 d'};  
temp.LL    = C2K(20);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'MoniBegu2016';

% weight - weight after 120 d
data.WwWw = [ ... % tissue wet weight (g), tissue wet weight after 120 d (g),
    11.86 13.08
    11.97 13.5
    16.05 18.33];
units.WwWw   = {'g', 'g'};  label.WwWw = {'flesh wet weight','flesh wet weight after 120 d'};  
temp.WwWw    = C2K(20);  units.temp.WwWw = 'K'; label.temp.WwWw = 'temperature';
bibkey.WwWw = 'MoniBegu2016';

% length-wet weight
data.LWd = [ ... % shell length (cm), dry weight (g)
3.555	0.514
3.658	0.386
3.702	0.171
3.792	0.429
3.896	0.471
3.956	0.729
4.029	0.471
4.059	0.471
4.104	0.686
4.223	0.643
4.223	0.943
4.282	0.514
4.297	0.729
4.386	0.600
4.401	0.857
4.476	1.157
4.504	0.600
4.520	0.814
4.551	1.371
4.624	1.157
4.625	1.329
4.653	0.600
4.698	0.986
4.744	1.371
4.776	2.614
4.787	0.814
4.788	1.286
4.803	1.243
4.820	2.357
4.847	1.157
4.875	0.729
4.922	1.586
4.951	1.329
5.010	1.029
5.010	1.329
5.070	1.629
5.113	0.814
5.113	0.900
5.129	1.329
5.160	1.714
5.202	0.986
5.263	1.371
5.263	1.543
5.264	1.843
5.322	1.200
5.367	1.457
5.368	1.843
5.411	1.500
5.455	1.071
5.460	3.000
5.485	1.457
5.502	2.057
5.516	1.714
5.519	2.914
5.559	1.243
5.605	1.757
5.606	2.186
5.634	1.457
5.635	1.886
5.652	3.043
5.723	1.629
5.739	2.057
5.753	1.800
5.812	1.543
5.902	1.800
5.947	2.014
5.950	3.386
5.960	1.586
6.021	2.186
6.050	1.671
6.080	1.929
6.109	1.843
6.141	2.529
6.142	3.214
6.184	1.843
6.214	2.143
6.277	3.686
6.304	2.443
6.317	1.929
6.362	1.929
6.363	2.571
6.394	2.914
6.423	2.529
6.423	2.829
6.510	2.100
6.529	3.557
6.557	2.914
6.674	2.314
6.691	3.043
6.704	2.186
6.752	3.643
6.795	3.043
6.795	3.343
6.808	2.443
6.836	1.843
6.852	2.229
6.853	2.657
6.870	3.429
6.871	3.814
6.944	3.471
6.958	3.129
6.970	2.143
6.975	3.857
7.001	2.486
7.003	3.343
7.019	3.686
7.030	2.143
7.076	2.743
7.076	3.043
7.090	2.614
7.094	4.157
7.136	3.043
7.137	3.600
7.179	2.614
7.226	3.386
7.241	3.729
7.284	2.957
7.284	3.129
7.286	3.643
7.287	4.071
7.288	4.629
7.304	4.886
7.327	2.400
7.331	3.900
7.357	2.657
7.359	3.429
7.388	3.257
7.391	4.329
7.403	3.086
7.406	4.329
7.431	2.400
7.449	3.900
7.466	4.714
7.493	3.557
7.497	5.057
7.520	2.443
7.535	2.657
7.537	3.171
7.539	4.071
7.539	4.329
7.540	4.629
7.542	5.271
7.551	2.914
7.582	3.686
7.586	4.971
7.628	4.029
7.659	4.586
7.686	3.429
7.686	3.686
7.687	4.114
7.703	4.414
7.719	5.143
7.734	4.886
7.746	3.900
7.758	2.786
7.774	3.214
7.791	4.157
7.807	4.671
7.818	3.086
7.824	5.486
7.834	3.557
7.835	3.900
7.840	5.743
7.866	4.414
7.875	2.186
7.882	4.714
7.892	2.871
7.901	6.386
7.906	2.700
7.926	4.714
7.940	4.243
7.942	5.057
7.943	5.400
7.967	3.257
7.968	3.643
7.980	2.357
7.981	2.957
8.016	5.100
8.017	5.443
8.017	5.529
8.018	5.914
8.030	4.629
8.041	3.257
8.073	4.329
8.078	6.257
8.082	1.800
8.084	2.657
8.089	4.800
8.092	5.957
8.113	2.271
8.118	4.543
8.131	3.729
8.135	5.143
8.172	2.357
8.189	3.171
8.190	3.471
8.196	5.743
8.208	4.929
8.211	5.829
8.219	3.000
8.224	5.400
8.277	2.571
8.294	3.343
8.299	5.700
8.312	4.929
8.326	4.629
8.343	5.529
8.344	5.957
8.346	6.471
8.368	3.557
8.397	3.000
8.402	5.229
8.415	4.414
8.418	5.657
8.428	3.771
8.431	4.971
8.433	5.700
8.435	6.386
8.458	4.071
8.475	4.800
8.483	2.014
8.483	2.186
8.487	3.557
8.500	2.957
8.504	4.329
8.516	3.300
8.521	5.486
8.522	5.743
8.525	6.900
8.526	7.243
8.539	6.600
8.591	3.557
8.592	4.114
8.612	6.214
8.614	6.986
8.621	3.857
8.640	5.571
8.668	4.671
8.681	4.200
8.687	6.686
8.688	7.071
8.694	3.514
8.700	5.614
8.722	2.529
8.730	6.043
8.742	4.586
8.759	5.829
8.770	4.114
8.775	6.000
8.783	3.214
8.788	5.357
8.791	6.514
8.799	3.771
8.803	5.486
8.830	4.457
8.834	6.043
8.835	6.343
8.852	7.243
8.877	5.486
8.884	8.014
8.895	6.643
8.896	7.029
8.916	3.086
8.922	5.743
8.932	3.643
8.935	4.714
8.974	2.529
8.975	3.086
8.976	3.471
9.120	7.800
9.127	4.500
9.132	6.343
9.137	8.443
9.203	5.186
9.320	4.671
9.365	4.886
9.471	5.486
9.557	10.286
9.620	6.086
9.717	9.214
9.742	7.243
9.951	7.671
10.091	10.586
10.109	5.657
10.271	11.314];
units.LWd   = {'cm', 'g'};  label.LWd = {'shell length','tissue dry weight'};  
bibkey.LWd = 'NahaIsla2019';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 5 * weights.LL;
weights.WwWw = 5 * weights.WwWw;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3RZ2Y'; % Cat of Life
metaData.links.id_ITIS = '984196'; % ITIS
metaData.links.id_EoL = '4751764'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1685953'; % Taxonomicon
metaData.links.id_WoRMS = '989458'; % WoRMS
metaData.links.id_molluscabase = '989458'; % molluscabase


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
bibkey = 'MoniBegu2016'; type = 'Article'; bib = [ ... 
'author = {Md. Moniruzzaman and Mohosena Begum Tanu and Arun Chandra Barman and Mohammad Ferdous Siddique and Abu Rayhan}, ' ... 
'year = {2016}, ' ...
'title = {Growth performance of \emph{Lamellidens marginalis} under captive condition in semi-arid zone of {B}angladesh}, ' ...
'journal = {International Journal of Natural and Social Sciences}, ' ...
'volume = {3(4)}, '...
'pages = {62-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NahaIsla2019'; type = 'Article'; bib = [ ... 
'doi = {10.3329/jbs.v27i0.44677}, ' ...
'author = {D. A. Nahar and M. R. Islam and M. S. Islam and S. Jasmine and M. M. R. Mondol}, ' ... 
'year = {2019}, ' ...
'title = {GROWTH PATTERN OF FRESHWATER BIVALVE MOLLUSK \emph{Lamellidens marginalis} ({L}AMARCK, 1819) FROM THE NORTHWEST {B}ANGLADESH}, ' ...
'journal = {J. Bio-Sci.}, ' ...
'volume = {27}, '...
'pages = {121-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NiogTonn2019'; type = 'Article'; bib = [ ... 
'doi = {10.33997/j.afs.2019.32.3.004}, ' ...
'author = {Sathe Rani Niogee and Khaleda Ferdoush Tonni and Arun Chandra Barman and Mohosena Begum Tanu and Sonia Sku and M. Jasim Uddini}, ' ... 
'year = {2019}, ' ...
'title = {Ovarian Cycle of Freshwater Pearl Mussel, \emph{Lamellidens marginalis} ({L}amarck, 1819) Collected from a Culture Pond in {B}angladesh}, ' ...
'journal = {2019}, ' ...
'volume = {32}, '...
'pages = {117-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

