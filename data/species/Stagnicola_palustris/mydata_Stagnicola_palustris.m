function [data, auxData, metaData, txtData, weights] = mydata_Stagnicola_palustris

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Lymnaeidae';
metaData.species    = 'Stagnicola_palustris'; 
metaData.species_en = 'Common European pondsnail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Lars Kramer'; 'Joris Koene'; 'Bas Kooijman'};    
metaData.date_subm = [2014 06 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 26]; 

%% set data
% zero-variate data

data.ab = 12;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KramKoen2014';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 30;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KramKoen2014';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 52;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KramKoen2014';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 360;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'KramKoen2014';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KramKoen2014';
data.Lj  = 0.50; units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'KramKoen2014';
data.Lp  = 1.05; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KramKoen2014';
data.Li  = 1.30; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KramKoen2014';

data.Wwb = 5.97e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KramKoen2014';
data.Wwj = 1.404e-2;units.Wwj = 'g'; label.Wwj = 'wet weight at metam';    bibkey.Wwj = 'KramKoen2014';
data.Wwp = 0.13;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'KramKoen2014';
data.Wwi = 0.2467; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KramKoen2014';
 comment.Wwi = 'estimated from (1.75/0.85)^3 * 0.27';
 
data.Ri  = 21;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KramKoen2014';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
L_PGE = [ ... % age (d), total length (cm)
1.552	2.260	4.032	6.142	7.392	5.687	6.586	10.918
1.598	1.934	3.661	3.174	7.830	8.174	10.326	11.583
1.357	1.905	2.598	3.104	4.881	8.946	10.168	8.417
1.443	2.428	4.772	3.527	5.394	8.075	8.959	10.338
1.266	3.110	3.355	4.245	6.245	6.880	9.939	8.698
1.037	1.178	3.345	5.140	7.203	7.668	11.301	9.597
1.222	2.026	1.550	5.688	8.260	9.630	9.258	12.623
1.366	2.835	3.717	2.563	4.183	9.567	7.077	11.631
1.326	1.591	2.609	5.714	7.729	5.227	11.025	9.727
1.058	1.001	2.119	3.687	5.478	7.899	11.216	12.881
0.888	1.259	1.886	2.971	5.016	6.367	9.433	11.545
1.540	1.888	1.878	2.213	3.297	10.143	6.923	12.224
0.703	2.326	4.233	6.392	8.494	4.900	11.706	9.034
1.331	1.759	2.928	5.264	7.437	9.514	9.674	12.077
1.240	2.063	3.756	6.709	8.178	9.227	9.950	10.562
1.388	2.503	2.914	4.342	7.175	9.052	11.159	11.449
1.298	2.180	3.930	5.214	7.260	8.009	10.172	11.796
1.266	2.897	3.247	5.888	6.420	9.251	10.066	10.551
1.571	2.138	4.866	6.587	6.979	7.721	11.078	12.000
1.012	2.508	4.640	5.125	6.971	9.490	11.063	11.587
1.378	2.490	3.296	4.502	7.289	7.594	10.674	12.130
1.367	2.279	4.084	4.356	6.213	9.759	10.790	12.854
1.563	1.831	4.050	6.054	8.454	8.718	10.555	10.872
1.186	2.101	3.071	3.685	6.684	7.655	9.029	10.142
1.423	2.305	2.917	5.147	5.710	10.041	10.763	11.307
1.594	2.122	3.229	5.546	7.003	9.290	10.582	13.267
1.545	2.099	3.899	4.644	8.053	10.265	11.448	10.588]';
t = [19	26	33	40	47	54	61	68]' - 12; % time since birth (d)
data.tL = [t, sum(L_PGE,2)/27]; data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KramKoen2014';
comment.tL = 'one snail per container';
  
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
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'KramKoen2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZGW9'; % Cat of Life
metaData.links.id_ITIS = '76559'; % ITIS
metaData.links.id_EoL = '3013056'; % Ency of Life
metaData.links.id_Wiki = 'Stagnicola_palustris'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '662393'; % Taxonomicon
metaData.links.id_WoRMS = '594993'; % WoRMS
metaData.links.id_molluscabase = '594993'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stagnicola_palustris}}';
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

