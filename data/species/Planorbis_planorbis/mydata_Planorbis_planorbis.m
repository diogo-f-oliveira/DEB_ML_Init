function [data, auxData, metaData, txtData, weights] = mydata_Planorbis_planorbis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Planorbis_planorbis'; 
metaData.species_en = 'Ram''s horn snail'; 

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
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 16]; 

%% set data
% zero-variate data

data.ab = 12.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KramKoen2014';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 22.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KramKoen2014';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 47.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KramKoen2014';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 210;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'KramKoen2014';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.06; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KramKoen2014';
data.Lj  = 0.30; units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'KramKoen2014';
data.Lp  = 0.72; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KramKoen2014';
data.Li  = 1.10; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KramKoen2014';

data.Wwb = 6.117e-5;units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KramKoen2014';
data.Wwj = 8.800e-3;units.Wwj = 'g'; label.Wwj = 'wet weight at metam';    bibkey.Wwj = 'KramKoen2014';
data.Wwp = 1.216e-1;units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'KramKoen2014';
data.Wwi = 4.336e-1;units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KramKoen2014';
 
data.Ri  = 10;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KramKoen2014';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
L_PGE = [ ... % age (d), total length (cm)
0.675	1.320	2.293	4.150	7.590	7.472	6.250	10.068
0.909	1.757	3.161	5.824	6.861	9.172	8.155	9.259
0.836	2.000	3.700	5.071	5.440	5.978	9.326	7.843
1.075	2.423	4.387	6.333	7.618	8.302	9.480	9.895
1.083	2.746	4.509	6.207	7.462	8.630	9.197	9.349
1.098	2.541	4.097	6.420	8.746	9.517	10.341	10.253
0.827	2.498	4.490	6.232	8.324	9.410	9.619	9.744
1.389	3.443	4.753	5.943	7.667	8.065	9.200	9.921
0.703	1.358	2.022	2.866	4.243	4.766	6.103	7.286
1.375	2.620	4.171	5.926	7.731	8.235	8.882	9.734
1.188	1.743	4.152	4.546	7.511	9.185	8.928	9.035
0.965	2.680	2.944	5.799	5.370	6.176	6.958	8.160
1.060	2.511	3.499	5.510	7.872	8.120	8.918	9.521
0.989	2.550	3.604	4.908	7.321	8.995	9.889	10.608
1.025	2.570	4.724	6.169	8.069	8.732	9.941	10.899
1.122	2.283	4.262	6.152	7.999	9.318	9.740	10.432
1.079	2.373	3.936	5.690	8.061	9.024	10.013	10.4
1.273	2.355	4.138	5.447	7.207	8.040	8.716	10.4
0.998	2.604	4.407	6.639	7.893	8.497	9.297	10.421
1.280	2.845	4.239	6.382	7.843	8.681	9.493	9.788
1.117	2.703	4.289	6.583	8.465	9.231	10.136	9.146
1.860	2.728	4.241	6.512	6.902	8.197	8.485	10.799
1.327	3.158	3.840	6.800	8.273	9.042	8.370	10.090
1.074	2.335	4.390	5.468	7.026	7.722	9.563	8.667]';
t = [21	29	36	43	51	57	63	70]' - 12.5; % time since birth, d
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
metaData.links.id_CoL = '77NYP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2979529'; % Ency of Life
metaData.links.id_Wiki = 'Planorbis_planorbis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '38526'; % Taxonomicon
metaData.links.id_WoRMS = '182693'; % WoRMS
metaData.links.id_molluscabase = '182693'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planorbis_planorbis}}';
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
