function [data, auxData, metaData, txtData, weights] = mydata_Lampsilis_radiata

% http://www.debtheory.org/wiki/index.php?title=Mydata_file#Metadata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Lampsilis_radiata'; 
metaData.species_en = 'Eastern lampmussel'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'jiFr'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 01 31];      


%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'Jirk1986';  
  comment.Lb = 'value for Actinonaias_ligamentina';
data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 8.35;   units.Li  = 'cm';  label.Li  = 'ultimate shell length for females';   bibkey.Li  = 'MattBorr2013';
data.Lim  = 9.21;   units.Lim  = 'cm';  label.Lim  = 'ultimate shell length for females';   bibkey.Lim  = 'MattBorr2013';

data.Wwi = 14.91;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
  comment.Wwi = 'Wet weight includes shell and environmental water';

data.Ri  = 5.33e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = 'PerlChri2003';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
  
% time-length
data.LLs = [ ... % shell length at t (cm), shell length at t + 1 yr (cm)
2.434	3.367
2.572	3.441
2.671	3.706
2.764	3.556
2.839	3.763
2.841	3.473
2.847	3.705
2.854	3.937
2.916	3.879
2.917	3.672
2.924	3.796
2.948	3.572
2.994	3.589
3.016	3.746
3.016	3.696
3.027	4.716
3.038	4.086
3.055	3.663
3.084	4.102
3.092	3.937
3.129	4.334
3.129	4.202
3.137	4.135
3.161	4.003
3.169	3.812
3.215	3.994
3.284	3.853
3.292	3.952
3.314	4.019
3.320	4.433
3.352	4.234
3.520	4.399
3.568	3.968
3.574	4.333
3.588	4.598
3.621	4.250
3.696	4.515
3.742	4.540
3.743	4.440
3.743	4.349
3.819	4.481
3.949	4.697
4.301	4.919];
units.LLs = {'cm', 'cm'}; label.LLs = {'shell length at t', 'shell length at t + 1 yr', 'sand at inner Long Point Bay, Lake Erie'};  
temp.LLs = C2K(18);  units.temp.LLs = 'K'; label.temp.LLs = 'temperature';
bibkey.LLs = 'HincBail1986';
comment.LLs = 'Data for sand at inner Long Point Bay, Lake Erie';
%
data.LLm = [ ... % % shell length at t (cm), shell length at t + 1yr (cm)
1.687	2.266
1.702	2.233
1.717	2.366
1.778	2.316
1.779	2.233
1.801	2.365
1.810	2.100
1.815	2.689
1.840	2.357
1.863	2.307
1.870	2.382
1.884	2.722
1.916	2.523
1.947	2.307
1.954	2.489
2.016	2.414
2.030	2.680
2.039	2.514
2.039	2.439
2.078	2.422
2.092	2.530
2.099	2.663
2.100	2.580
2.116	2.422
2.122	2.862
2.123	2.538
2.138	2.613
2.139	2.373
2.154	2.480
2.176	2.679
2.214	2.721
2.223	2.604
2.237	2.745
2.253	2.770
2.277	2.563
2.283	2.911
2.291	2.853
2.306	2.795
2.335	3.110
2.360	2.712
2.383	2.836
2.398	2.811
2.407	2.670
2.452	2.778
2.513	2.960
2.604	3.184
2.659	2.943
2.780	3.224];
units.LLm = {'cm', 'cm'}; label.LLm = {'shell length at t', 'shell length at t + 1 yr', 'mud at inner Long Point Bay, Lake Erie'};  
temp.LLm = C2K(18);  units.temp.LLm = 'K'; label.temp.LLm = 'temperature';
bibkey.LLm = 'HincBail1986';
comment.LLm = 'Data for mud at inner Long Point Bay, Lake Erie';

%% set weights for all real data
weights = setweights(data, []);
weights.LLs = 5 * weights.LLs;
weights.LLm = 5 * weights.LLm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LLs', 'LLm'}; subtitle1 = {'Data for sand, mud in Duck river'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'All temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3S5YY'; % Cat of Life
metaData.links.id_ITIS = '79994'; % ITIS
metaData.links.id_EoL = '449574'; % Ency of Life
metaData.links.id_Wiki = 'Lampsilis'; % Wikipedia
metaData.links.id_ADW = 'Lampsilis_radiata'; % ADW
metaData.links.id_Taxo = '432365'; % Taxonomicon
metaData.links.id_WoRMS = '160342'; % WoRMS
metaData.links.id_molluscabase = '160342'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampsilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/449574}}';
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
bibkey = 'HincBail1986'; type = 'Article'; bib = [ ... 
'author = {Scott G. Hinch and Robert C. Bailey, and Roger H. Green}, ' ... 
'year = {1986}, ' ...
'title = {Growth of \emph{Lampilis radiata} ({B}ivalvia: {U}nionidae Sand and Mud: A Reciprocal Transplant Experiment}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {43}, ' ...
'pages = {548-552}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MattBorr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1674/0003-0031-169.1.122}, ' ...
'author = {Stephen F. Matter and Francisco Borrero and Cody Fleece}, ' ... 
'year = {2013}, ' ...
'title = {Modeling the Survival and Population Growth of the Freshwater Mussel, \emph{Lampsilis radiata luteola}}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {169(1)}, ' ...
'pages = {122-136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PerlChri2003'; type = 'Article'; bib = [ ... 
'author = {Stephanie J. Perles and Alan D. Christian and David J. Berg}, ' ... 
'year = {2003}, ' ...
'title = {Vertical Migration, Orientation, Aggregation, and Fecundity of the Freshwater Mussel \emph{Lampsilis siliquoidea}}, ' ...
'journal = {Ohio J. Sci.}, ' ...
'volume = {103(4)}, ' ...
'pages = {73-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


