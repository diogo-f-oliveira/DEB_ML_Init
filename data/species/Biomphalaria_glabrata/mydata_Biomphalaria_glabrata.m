function [data, auxData, metaData, txtData, weights] = mydata_Biomphalaria_glabrata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Biomphalaria_glabrata'; 
metaData.species_en = 'Freshwater snail'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Lars Kramer'; 'Joris Koene'; 'Bas Kooijman'};    
metaData.date_subm = [2014 06 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.ab = 13;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KramKoen2014';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 29;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KramKoen2014';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 37.2;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KramKoen2014';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 360;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'KramKoen2014';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.096; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KramKoen2014';
data.Lp  = 1.00; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KramKoen2014';
data.Li  = 1.75; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KramKoen2014';

data.Wwb = 3.8794e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KramKoen2014';
data.Wwj = 0.14;units.Wwj = 'g'; label.Wwj = 'wet weight at metam';    bibkey.Wwj = 'KramKoen2014';
data.Wwp = 0.44;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'KramKoen2014';
data.Wwi = 2.35; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KramKoen2014';
 comment.Wwi = 'estimated from (1.75/0.85)^3 * 0.27';
 
data.Ri  = 137;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KramKoen2014';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
L_IGE = [ ... % age (d), total length (cm)
2.070	4.315	4.663	8.314	11.919	13.842	14.941	16.478
2.237	4.790	6.959	11.227	12.871	12.825	12.883	0
2.263	4.360	6.928	10.414	13.550	15.179	15.949	16.753
1.574	3.390	6.243	9.994	11.886	13.601	14.635	15.463
2.317	0.896	0	    0   	0   	0   	0	    0
1.825	3.690	6.584	8.921	11.494	13.096	14.696	15.674
2.085	4.063	5.719	9.627	12.244	15.311	16.109	17.345
2.662	5.392	7.457	10.609	10.780	14.487	14.654	14.384
1.247	1.388	0	    0	    0 	    0	    0	    0
1.804	3.573	4.860	7.185	10.779	0    	13.789	14.936
1.716	3.848	5.554	9.059	10.452	13.313	14.368	15.377
1.711	3.627	4.903	7.123	9.825	11.038	12.439	13.618
1.747	3.279	7.214	10.773	13.015	16.333	16.711	18.150
1.895	3.761	6.528	10.035	12.980	14.512	15.215	16.583
1.068	1.512	2.758	6.113	10.383	 0       0       0];
t = [23	30	37	44	51	58	65	72]'; % age, d
%
L_PGE = [ ...
1.541	1.952	6.426	8.482	10.905	13.069	14.702	14.881
1.931	3.160	5.360	9.21	11.341	11.905	13.825	15.575
1.781	2.356	3.008	4.323	5.762	6.464	8.534	9.792
2.699	3.690	6.190	10.245	11.456	13.402	12.531	12.943
2.147	4.869	8.195	7.806	10.104	11.358	15.593	16.920
2.002	3.857	5.617	8.127	10.757	12.374	13.090	12.672
1.532	3.284	6.014	8.677	10.387	12.191	14.403	15.515
2.539	4.550	6.366	9.419	11.727	13.584	14.885	16.981
2.451	4.498	6.281	8.622	11.738	13.425	13.751	15.474
2.045	4.138	5.931	8.646	11.252	12.562	13.436	14.469
1.980	3.486	5.826	7.723	10.565	12.322	16.433	15.407
1.351	2.858	2.744	8.216	11.355	12.758	11.595	12.907
0.858	1.445	4.857	5.016	7.337	9.472	13.128	13.611
1.566	3.376	4.794	7.741	9.912	12.167	13.269	17.170
1.676	3.366	4.639	5.059	7.728	10.039	11.486	12.615
2.023	4.026	6.007	7.865	11.298	10.856	11.308	13.990
2.165	3.917	6.586	8.241	9.857	13.213	14.841	15.840
2.445	5.360	6.929	9.505	10.445	12.952	14.822	15.173
2.243	3.525	5.869	7.671	10.923	11.807	13.600	13.402
2.089	4.254	6.600	8.878	10.054	12.251	13.457	14.378
1.813	3.334	5.290	8.068	9.740	12.535	13.182	15.587
1.900	3.383	5.741	7.585	9.597	15.500	12.421	13.766
1.826	2.891	5.106	9.846	12.781	11.553	16.817	15.103
2.150	3.811	5.049	9.444	9.982	12.523	14.783	18.027
1.420	3.159	4.992	8.465	11.394	13.667	13.180	16.055
1.760	3.300	6.984	9.631	10.185	13.368	14.635	16.210
2.410	4.949	5.574	7.428	12.506	12.161	13.825	15.933
1.538	2.369	3.535	9.564	11.420	13.418	10.077	11.079
1.788	3.757	6.619	4.671	5.550	8.495	14.804	16.242]';
data.tL = [t, sum(L_PGE,2)/27]; data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KramKoen2014';
comment.tL = 'one snail per container';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LV34'; % Cat of Life
metaData.links.id_ITIS = '76637'; % ITIS
metaData.links.id_EoL = '452452'; % Ency of Life
metaData.links.id_Wiki = 'Biomphalaria_glabrata'; % Wikipedia
metaData.links.id_ADW = 'Biomphalaria_glabrata'; % ADW
metaData.links.id_Taxo = '125350'; % Taxonomicon
metaData.links.id_WoRMS = '848622'; % WoRMS
metaData.links.id_molluscabase = '848622'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Biomphalaria_glabrata}}';
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
bibkey = 'KramKoen2014'; type = 'Misc'; bib = [ ... 
'author = {Kramer, L. and Koene, J.}, ' ... 
'year = {2014}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
