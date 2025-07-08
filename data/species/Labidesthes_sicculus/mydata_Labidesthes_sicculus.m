function [data, auxData, metaData, txtData, weights] = mydata_Labidesthes_sicculus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Labidesthes_sicculus'; 
metaData.species_en = 'Brook silverside'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 06 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 28]; 

%% set data
% zero-variate data

data.tp = 100;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on reproduction in first summer and Lp';
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'EoL';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'EoL and Wiki give 1 yr';

data.Lp  = 7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 1.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'PowlSand2008';
  comment.Wwb = 'based of egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwi = 15; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.10, see F1';
  
data.Ri = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Menidia_beryllina'; 

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
17.608	1.280
20.810	1.453
24.496	1.453
24.784	3.495
25.116	2.785
25.128	2.042
27.846	2.422
28.653	2.093
29.443	2.803
29.770	2.370
29.776	2.024
29.944	1.505
30.403	2.889
31.065	1.574
31.524	2.941
31.846	2.837
32.798	3.408
33.129	2.768
33.150	1.436
33.444	3.131
33.446	3.010
33.633	1.298
34.568	2.993
34.890	2.889
35.031	4.083
35.188	4.308
35.359	3.633
35.367	3.114
36.331	2.976
36.482	3.564
36.487	3.235
36.636	3.927
36.647	3.235
36.805	3.408
37.439	3.824
37.615	2.855
37.925	3.478
38.084	3.581
38.087	3.391
38.091	3.131
38.728	3.391
38.885	3.599
39.528	3.495
39.547	2.284
39.550	2.128
39.680	4.014
39.694	3.131
39.856	2.993
40.811	3.408
40.812	3.322
40.823	2.664
40.829	2.318
41.139	2.958
41.461	2.872
41.628	2.405
41.764	3.962
41.767	3.754
41.775	3.235
41.798	1.834
41.920	4.187
41.938	3.080
42.236	4.464
42.253	3.443
43.040	4.308
43.218	3.235
43.846	4.048
43.848	3.893
43.850	3.806
44.183	2.993
44.196	2.163
44.644	4.221
44.814	3.633
44.816	3.478
44.817	3.408
45.435	4.844
45.929	4.031
45.930	4.014
46.245	4.308
46.889	4.170
47.057	3.633
47.709	2.976
47.842	4.689
47.844	4.567
47.847	4.394
48.170	4.187
48.822	3.495
48.974	4.031
49.132	4.204
49.149	3.149
49.589	5.657
49.601	4.913
49.603	4.775
49.605	4.637
49.609	4.412
50.406	4.689
50.413	4.239
50.737	4.014
51.533	4.360
51.688	4.689
52.017	4.187
52.018	4.066
52.330	4.619
52.798	5.450
52.813	4.464
52.977	4.221
53.452	4.637
53.768	4.896
53.779	4.187
53.781	4.066
53.925	5.087
54.254	4.567
54.730	4.879
55.061	4.187
55.374	4.671
55.686	5.190
55.853	4.792
55.859	4.429
55.860	4.360
55.862	4.204
55.873	3.547
56.828	3.962
56.976	4.706
57.929	5.225
58.094	4.948
58.096	4.810
58.097	4.740
58.111	3.893
59.046	5.571
59.694	5.104
59.701	4.689
59.849	5.415
59.859	4.844
59.859	4.792
60.819	4.931
60.826	4.498
61.454	5.260
61.769	5.623
61.938	5.104
62.417	5.225
62.750	4.394
62.903	4.879
63.056	5.311
64.185	4.896
64.652	5.761
64.660	5.260
65.786	5.000
66.245	6.332
66.558	6.817
67.252	3.512
67.384	5.277
67.527	6.332
67.856	5.796
67.858	5.675
68.035	4.637
69.333	3.616
69.781	5.692
69.921	6.955
69.947	5.346
70.417	5.986
70.895	6.159
70.910	5.208
72.808	6.799
72.828	5.519
72.982	5.917
74.590	5.571
74.917	5.190
75.866	5.952
78.579	6.696
79.717	5.692
79.856	6.990
81.796	5.952
85.961	6.021];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PowlSand2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00525 * TL^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NQ9H'; % Cat of Life
metaData.links.id_ITIS = '166016'; % ITIS
metaData.links.id_EoL = '995114'; % Ency of Life
metaData.links.id_Wiki = 'Labidesthes_sicculus'; % Wikipedia
metaData.links.id_ADW = 'Labidesthes_sicculus'; % ADW
metaData.links.id_Taxo = '177972'; % Taxonomicon
metaData.links.id_WoRMS = '422550'; % WoRMS
metaData.links.id_fishbase = 'Labidesthes-sicculus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labidesthes_sicculus}}'];
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
bibkey = 'PowlSand2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-007-9304-8}, ' ...
'author = {Percival M. Powles and Ian M. Sandeman}, ' ... 
'year = {2008}, ' ...
'title = {Growth, summer cohort output, and observations on the reproduction of brook silverside, \emph{Labidesthes sicculus} ({C}ope) in the {K}awartha {L}akes, {O}ntario}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {82}, ' ...
'pages = {421-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Labidesthes-sicculus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{https://eol.org/pages/995114/articles}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

