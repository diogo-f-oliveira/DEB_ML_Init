  function [data, auxData, metaData, txtData, weights] = mydata_Pseudoxiphophorus_bimaculatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Pseudoxiphophorus_bimaculatus'; 
metaData.species_en = 'Twospot livebearer'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'L-N','t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data
data.am = 2.5*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'OlinPeop2016';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.8;  units.Lp = 'cm';  label.Lp = 'mean total length at puberty';  bibkey.Lp = 'OlinPeop2016';
  comment.Lp = 'based on SL 4.0 cm, TL = 0.26125 + 4.0/ 0.8736';
data.Lpm = 3.05;  units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';  bibkey.Lpm = 'OlinPeop2016';
  comment.Lpm = 'based on SL 2.5 cm, TL = -0.02399 + 2.5/ 0.8128';
data.Li = 9.1;  units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';
data.Lim = 6.3; units.Lim = 'cm'; label.Lim = 'ultimate total length for male';  bibkey.Lim = 'Wiki';

data.Wwb = 4.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'OlinPeop2016';   
  comment.Wwb = 'based on egg diameter of 2.1 mm: pi/6*0.21^3';
data.Wwi = 9.96; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'OlinPeop2016';
data.Wwim = 1.85; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'OlinPeop2016';
   
% univariate data

% time -length
data.tL_f = [ ... % time since birth (d) SL (cm)
    0.8*365 4.44
    1.8*365 5.80
    2.8*365 7.86    ];
data.tL_f(:,2) = 0.26125 + data.tL_f(:,2)/ 0.8736; % convert SL to TL
units.tL_f = {'d','cm'};  label.tL_f = {'time since birth','total length', 'female'};     bibkey.tL_f = 'OlinPeop2016';
temp.tL_f = C2K(21); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d) SL (cm)
    0.8*365 4.09
    1.8*365 4.61];
data.tL_m(:,2) = -0.02399 + data.tL_m(:,2)/ 0.8128; % convert SL to TL
units.tL_m = {'d','cm'};  label.tL_m = {'time since birth','total length', 'male'};     bibkey.tL_m = 'OlinPeop2016';
temp.tL_m = C2K(21); units.temp.tL_m = 'K'; label.temp.tL_f = 'temperature'; 
comment.tL_m = 'Data for males';

% length = fecundity
data.LN = [ ... std length (cm), litter size (#)
4.809	11.307
4.891	8.040
4.994	23.116
5.046	8.040
5.076	15.829
5.117	24.372
5.169	45.477
5.169	36.432
5.210	14.322
5.374	6.784
5.488	36.432
5.488	14.824
5.518	28.392
5.580	48.241
5.590	9.799
5.673	73.618
5.673	39.196
5.683	68.090
5.683	25.879
5.703	31.910
5.714	52.261
5.765	10.553
5.765	38.191
5.786	16.834
5.796	46.482
5.858	12.312
5.878	6.784
5.878	27.889
5.888	33.166
5.888	42.965
5.971	31.658
5.981	6.784
5.991	92.965
5.991	35.930
6.001	51.256
6.104	24.372
6.166	9.548
6.186	45.729
6.269	58.543
6.279	8.291
6.300	11.809
6.300	16.080
6.300	18.593
6.300	22.111
6.474	15.829
6.485	12.312
6.485	11.055
6.515	68.090
6.577	46.985
6.587	22.613
6.670	19.849
6.670	16.080
6.680	62.060
6.690	29.397
6.762	19.095
6.875	10.804
6.875	26.382
6.885	88.191
6.968	13.065
6.978	16.583
7.060	36.683
7.060	44.975
7.101	23.367
7.163	36.935
7.276	17.337
7.286	48.744
7.297	50.503
7.379	43.467
7.379	77.889
7.482	31.910
7.492	40.201
7.492	69.095
7.502	46.734
7.502	48.492
7.502	49.749
7.584	16.583
7.595	54.271
7.698	42.965
7.698	62.312
7.769	77.889
7.800	34.171
7.883	45.729
7.883	49.749
8.078	34.673
8.191	66.583
8.201	51.256
8.664	71.859
8.849	45.729
8.869	34.422
8.890	49.497
9.065	87.437
9.075	67.839];
data.LN(:,1) = 0.26125 + data.LN(:,1)/ 0.8736; % convert SL to TL
units.LN = {'cm','#'};  label.LN = {'total length','litter size'};     bibkey.LN = 'OlinPeop2016';
temp.LN = C2K(21); units.temp.LN = 'K'; label.temp.LN = 'temperature'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight length relationship: Ww in g = 0.00457 * (TL in cm)^3.08'; 
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length relationship from photo: SL = 0.84 * TL';
    metaData.bibkey.F2 = 'fishbase';
F3 = 'Ovoviviparous';
metaData.bibkey.F3 = 'OlinPeop2016';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '4PF3B'; % Cat of Life
metaData.links.id_ITIS = '165970'; % ITIS
metaData.links.id_EoL = '51896167'; % Ency of Life
metaData.links.id_Wiki = 'Pseudoxiphophorus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '658633'; % Taxonomicon
metaData.links.id_WoRMS = '1351416'; % WoRMS
metaData.links.id_fishbase = 'Pseudoxiphophorus-bimaculatus'; % fishbase


%% References

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudoxiphophorus-bimaculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudoxiphophorus}}';
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
bibkey = 'OlinPeop2016'; type = 'Article'; bib = [ ...
'doi = {10.1590/1982-0224-20150050}, ' ...
'author = {Charles T. Olinger and Brandon K. Peoples and Emmanuel A. Frimpong}, ' ...
'year = {2016}, ' ...
'title = {Reproductive life history of \emph{Heterandria bimaculata} ({H}eckel, 1848) ({P}oeciliinae: {P}oeciliidae) in the {H}onduran interior highlands: {T}rait variation along an elevational gradient}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {14(1)}, '...
'pages = {e150050}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

