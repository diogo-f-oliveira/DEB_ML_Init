  function [data, auxData, metaData, txtData, weights] = mydata_Clupea_harengus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Clupea_harengus'; 
metaData.species_en = 'Atlantic herring'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww_f'; 'L-Ww'};

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Lorna Teal'};        
metaData.date_subm = [2011 11 18];                           
metaData.email    = {'lorna.teal@wur.nl'};                 
metaData.address  = {'IMARES, IJmuiden'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2013 05 30];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data
data.ab = 27;      units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Geff2002'; 
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Geff2002 laboratory measurement';
data.aj = data.ab + 5*30;    units.aj = 'd';    label.aj = 'age at metam'; bibkey.aj = 'Blax1968'; % 4-5 month 
  temp.aj = C2K(11); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 4*365;  units.ap = 'd';  label.ap = 'age at puberty';            bibkey.ap = 'EngeHein2004';
  temp.ap = C2K(11);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'according to in-house herring biologists this is late - expected to be more like 2 years...';   
data.am = 22*365; units.am = 'd';    label.am = 'life span';              bibkey.am = {'fishbase','Lea1930'};   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'oldest in IMARES database: 20 years (Market sample) or 13 years (North Sea survey)';

data.Lb = 1.1;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Geff2002'; 
  comment.Lb = ['it is end of yolk sac stage - feeding could commence a little before; ', ...
  'Baxter 1968 reports a mean of 0.95 cm at first feeding (in situ)'];  
data.Lp = 29;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'EngeHein2004'; 
  comment.Lp = 'mean';
data.Li = 45;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = {'fishbase','BigeBrad1963'};

data.Wwi = 1050;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','Koli1990'};
  comment.Wwi = 'heaviest herring in IMARES database: 725 g (market sample) or 550g (North Sea survey data)';
  
data.Ri = 2e4/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate'; bibkey.Ri = {'fishbase'};   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is complete guess; rate for individual of length 45 cm - REF: fishbase (per year?)';
    
% uni-variate data
%  Age(years)-Length(m) relationships from IMARES herring survey data (North Sea herring)
%  Mean length per age calculated from 2010 data
data.tL = [ ... % time (a), length (m)
2	0.214392308
3	0.250283133
4	0.268164835
5	0.287060606
6	0.2957
7	0.2886
8	0.301857143
9	0.299666667
10	0.291333333
12	0.288];
data.tL(:,1) = 365 * data.tL(:,1); % covert a to d
data.tL(:,2) = 100 * data.tL(:,2); % covert m to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Teal2003'};
  comment.tL = 'temp is North sea guestimate; Mean length per age calculated from 2010 data for North Sea';

%
data.tL_N = [ ... % time (a), length (m), mean values across three periods is used (Norwegian spring spawning herring)
1   0.135
2	0.205
3	0.2537
4	0.2897
5	0.309
6	0.3273];
data.tL_N(:,1) = 365 * data.tL_N(:,1); % covert a to d
data.tL_N(:,2) = 100 * data.tL_N(:,2); % covert m to cm
units.tL_N = {'d', 'cm'};     label.tL_N = {'time since birth', 'total length'};  
  temp.tL_N = C2K(6); units.temp.tL_N = 'K'; label.temp.tL_N = 'temperature';
bibkey.tL_N = {'EngeHein2004'};
comment.tL_N = 'temp is guessed';

%  Age(years)-Weight(g) relationships from IMARES herring survey data (North Sea herring)
%  Mean weight per age calculated from 2010 data
%  assume f ~0.6, T = 273+ 10 K (North sea guestimates)
data.tW = [ ... % time since birth (a), wet weight (g)
2	80.63076923
3	131.5060241
4	154.6483516
5	203.9393939
6	204.6
7	189
8	226.8571429
9	238.5555556
10	205.7777778
12	175];
data.tW(:,1) = 365 * data.tW(:,1); % covert a to d
units.tW = {'d', 'gm'};     label.tW = {'time since birth', 'wet weight'};  bibkey.tW = {'Teal2003'};
  temp.tW = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
  comment.tW = 'temp taken for North sea; Mean weight per age calculated from 2010 data for North Sea';

%  Length(m)-Weight(g) relationships from IMARES herring survey data (North Sea herring)
%  Mean weight per length class calculated from 2010 data
%  assume f ~0.6
data.LW = [ ...
0.172	36
0.184	43
0.182	47
0.186	49
0.191	49.66666667
0.192	54
0.197	57.5
0.193	58
0.196	62
0.198	63
0.199	64
0.201	66.5
0.202	66.6
0.204	67.33333333
0.203	67.4
0.207	69.75
0.206	72.5
0.208	72.5
0.211	73.33333333
0.209	74
0.213	76.71428571
0.212	78.2
0.214	79.25
0.217	81.5
0.216	82.33333333
0.221	86.75
0.218	87.2
0.223	88.5
0.226	90.7
0.222	91.33333333
0.224	93
0.228	93
0.227	94.2
0.229	96
0.231	99.2
0.234	102
0.236	104.3
0.232	104.625
0.237	109.1428571
0.238	109.8333333
0.233	111
0.241	112.3333333
0.244	119.6666667
0.242	121.6666667
0.243	121.8571429
0.246	122.375
0.247	122.7142857
0.248	123.8333333
0.251	125.6
0.249	128.5
0.254	133.8
0.257	136.2
0.252	137.5
0.258	138
0.256	138.6666667
0.253	139.75
0.266	139.8
0.262	141.4285714
0.259	144.3333333
0.261	146.1111111
0.263	147.25
0.271	149.3333333
0.267	155.4285714
0.264	156
0.268	161.6
0.279	162.5
0.274	166.5
0.273	167
0.277	167.75
0.278	168.5
0.272	169.8888889
0.284	177
0.276	178.6666667
0.281	184.7777778
0.282	186.3333333
0.287	187.8
0.288	188.2
0.283	195.6666667
0.286	197.4285714
0.293	200.6666667
0.292	202.3333333
0.289	204
0.294	204
0.303	205
0.291	211.8571429
0.296	218.75
0.297	222
0.301	223.5
0.298	230
0.306	233.5
0.307	246.5
0.302	257
0.317	265
0.338	271
0.316	274
0.308	285.5
0.321	296];
data.LW(:,1) = 100 * data.LW(:,1); % covert m to cm
units.LW = {'cm', 'g'};     label.LW = {'time since birth', 'wet weight'};  
bibkey.LW = {'Teal2003'};
comment.LW = 'Mean weight per length class calculated from 2010 data for North Sea';
 
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
                                 
%% Links
metaData.links.id_CoL = 'WCQZ'; % Cat of Life
metaData.links.id_ITIS = '161722'; % ITIS
metaData.links.id_EoL = '46562387'; % Ency of Life
metaData.links.id_Wiki = 'Clupea_harengus'; % Wikipedia
metaData.links.id_ADW = 'Clupea_harengus'; % ADW
metaData.links.id_Taxo = '42634'; % Taxonomicon
metaData.links.id_WoRMS = '126417'; % WoRMS
metaData.links.id_fishbase = 'Clupea-harengus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupea_harengus}}';  
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
bibkey = 'Blax1968'; type = 'Article'; bib = [ ...  
'author = {Blaxter, J. H. S.}, ' ...
'year = {1968}, ' ...
'title = {Rearing Herring larvae to metamorphosis and beyond}, ' ... 
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = 49, '...
'pages = {17-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Geff2002'; type = 'Article'; bib = [ ...  
'author = {Geffen A. J.}, ' ...
'year = {2002}, ' ...
'title = {Length of herring larvae in relation to age and time of hatching.}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = 60, '...
'pages = {479--485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EngeHein2004'; type = 'Article'; bib = [ ...    
'author = {Engelhard G.H. and Heino M.}, ' ...
'year  = {2004}, ' ...
'title = {Maturity changes in {N}orwegian spring-spawning herring before, during and after a major population collapse}, ' ...  
'journal = {Fishseries Research}, ' ...
'volume = {66}, ' ...
'pages = {299--310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lea1930'; type = 'Article'; bib = [ ...    
'author = {Lea, B. E.}, ' ...
'year  = {1930}, ' ...
'title = {Mortality in the tribe of {N}orwegian herring}, ' ...  
'journal = {Rapports et Proces-Verbaux Des Reunions}, ' ...
'volume = {65}, ' ...
'pages = {100--117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Koli1990'; type = 'Book'; bib = [ ...    
'author = {Koli, L.}, ' ...
'year  = {1990}, ' ...
'title = {Suomen kalat. [Fishes of Finland]}, ' ...  
'publisher = {Werner S\"{o}derstr\"{o}m Osakeyhti\"{o}.}, ' ...
'address = {Helsinki}, '...
'note = {357 p}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BigeBrad1963'; type = 'Book'; bib = [ ...    
'author = {Bigelow, H. B. and M. G. Bradbury and J. R. Dymond and J. R. Greeley and S. F. Hildebrand and G. W. Mead and R. R. Miller and L. R. Rivas and W. L. Schroeder and R. D. Suttkus and V. D. Vladykov}, ' ...
'year  = {1963}, ' ...
'title = {Fishes of the western North Atlantic. Part three}, ' ...  
'publisher = {Mar. Res., Yale Univ. }, ' ...
'address = {New Haven, Sears Found}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Clupea-harengus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Teal2003'; type = 'Misc'; bib = [ ...
'author = {L. Teal}, ' ...
'year = {2003}, ' ...
'note = {IMARES data base}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  