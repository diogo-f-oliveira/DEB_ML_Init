function [data, auxData, metaData, txtData, weights] = mydata_Furcifer_pardalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Chamaeleonidae';
metaData.species    = 'Furcifer_pardalis'; 
metaData.species_en = 'Panther chameleon'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 12];

%% set data
% zero-variate data

data.ab = 240;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7*30.5;   units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Wiki';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching'; bibkey.Lb  = 'Eckh2018';  
data.Lp  = 7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'AndrGuar2005';  
data.Li  = 9.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';     bibkey.Li  = 'AndrGuar2005';
data.Lim = 13.8;   units.Lim = 'cm';  label.Lim  = 'ultimate SVL for males';      bibkey.Lim  = 'AndrGuar2005';

data.Wwb = 0.69;units.Wwb = 'g';  label.Wwb = 'wet at birth';                bibkey.Wwb = 'Eckh2018';
data.Wwi = 22.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'AndrGuar2005';
data.Wwim = 61;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'AndrGuar2005';
  
data.Ri  = 30/365;    units.Ri  = '#/d'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-40 eggs per clutch; females live 2 or 3 yrs after first reprod, 5-8 clutches in total';

% univariate data
% time-length
tL_f = [ ... % LAG (#), SVL (cm)
    0  3.7 % juv
    0  4.7 % juv
    0  4.9 % juv
    0  5.1 % juv
    0  6.1 % juv
    0  8.5 % ad
    0  9.1 % ad
    0 10.2 % ad
    0 10.5 % ad
    0 11.3 % ad
    1 12.0 % ad
];
data.Lt_f = tL_f(:,[2 1]); 
units.Lt_f  = {'cm', '#'};  label.Lt_f = {'SVL', 'LAG', 'female'};  
temp.Lt_f   = C2K(27);  units.temp.Lt_f = 'K'; label.temp.Lt_f = 'temperature';
bibkey.Lt_f = 'AndrGuar2005';
comment.Lt_f = 'Data for females';
% males
tL_m = [ ... % LAG (#), total (cm)
    0   8.5 % ad
    0  10.8 % ad
    0  11.8 % ad
    1  10.2 % ad
    1  17.4 % ad
    2  16.5 % ad
];
data.Lt_m = tL_m(:,[2 1]); 
units.Lt_m  = {'cm', '#'};  label.Lt_m = {'SVL', 'LAG', 'male'};  
temp.Lt_m   = C2K(27);  units.temp.Lt_m = 'K'; label.temp.Lt_m = 'temperature';
bibkey.Lt_m = 'AndrGuar2005';
comment.Lt_m = 'Data for females';

% length-weight
data.LW_f = [ ... % SVL (log mm), weight (log g)
1.690	0.614
1.693	0.849
1.777	0.993
1.785	0.923
1.793	1.058
1.795	0.783
1.802	1.165
1.804	0.914
1.811	1.013
1.819	0.853
1.844	1.095
1.846	0.964
1.853	1.334
1.862	1.001
1.878	1.260
1.878	1.161
1.878	0.939
1.886	0.894
1.895	1.297
1.910	0.960
1.929	1.338
1.938	1.161
1.938	1.338
1.938	1.058
1.943	1.087
1.945	1.161
1.952	1.396
1.954	1.507
1.956	1.161
1.965	1.161
1.977	1.606
1.977	1.227
1.978	1.161
1.978	1.124
1.987	1.573
1.987	1.606
1.993	1.437
1.994	1.540
1.994	1.305
2.002	1.680
2.002	1.606
2.004	1.425
2.006	1.260
2.009	1.474
2.010	1.606
2.011	1.713
2.012	1.178
2.012	1.227
2.019	1.639
2.019	1.540
2.020	1.478
2.022	1.190
2.030	1.606
2.030	1.330
2.037	1.198
2.038	1.063
2.039	1.342
2.046	1.655
2.046	1.330
2.053	1.610
2.063	1.400
2.070	1.507
2.078	1.363
2.079	1.783
2.080	1.663
2.088	1.750
2.090	1.507
2.096	1.680
2.096	1.655
2.103	1.437
2.103	1.359
2.120	1.680
2.138	1.680];
data.LW_f = 10.^data.LW_f; data.LW_f(:,1) = data.LW_f(:,1)/ 10; % remove log transform and convert mm to cm 
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'AndrGuar2005';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (log mm), weight (log g)
1.902	1.095
1.903	1.046
1.918	1.087
1.924	1.231
1.935	1.227
1.968	1.441
1.968	1.314
1.970	1.268
1.986	1.421
1.988	1.359
2.022	1.371
2.032	1.507
2.038	1.392
2.038	1.445
2.046	1.787
2.060	1.647
2.068	1.388
2.078	1.437
2.079	1.606
2.079	1.536
2.102	1.606
2.103	1.758
2.104	1.560
2.111	1.639
2.128	1.902
2.130	1.820
2.130	1.849
2.144	2.017
2.154	2.063
2.162	1.737
2.162	1.787
2.174	1.853
2.181	1.812
2.186	2.021
2.195	1.894
2.196	1.812
2.204	1.951
2.210	2.124
2.212	1.988
2.215	1.849
2.229	1.984
2.229	2.021
2.229	2.083
2.229	2.194
2.230	1.919
2.246	1.993
2.254	2.165
2.254	2.091
2.262	2.202
2.265	2.116
2.272	2.235
2.290	2.231];
data.LW_m = 10.^data.LW_m; data.LW_m(:,1) = data.LW_m(:,1)/ 10; % remove log transform and convert mm to cm 
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'AndrGuar2005';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = weights.Wwi * 3;
weights.Wwim = weights.Wwim * 3;
weights.Wwb = weights.Wwb * 10;
weights.tp = weights.tp * 5;
weights.Lp = weights.Lp * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Lt_f','Lt_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Since most growth occurs in the first yr, so Lines-of-Arrested-Growth (LAG) is 0, LAG is treated as function of SVL';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6K4Y8'; % Cat of Life
metaData.links.id_ITIS = '715210'; % ITIS
metaData.links.id_EoL = '1056895'; % Ency of Life
metaData.links.id_Wiki = 'Furcifer_pardalis'; % Wikipedia
metaData.links.id_ADW = 'Furcifer_pardalis'; % ADW
metaData.links.id_Taxo = '641171'; % Taxonomicon
metaData.links.id_WoRMS = '1525794'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Furcifer&species=pardalis'; % ReptileDB
metaData.links.id_AnAge = 'Furcifer_pardalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Furcifer_labordi}}';
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
bibkey = 'AndrGuar2005'; type = 'Article'; bib = [ ... 
'author = {F. Andreone and F. M. Guarino and J. E. Randrianirina}, ' ... 
'year = {2005}, ' ...
'title = {Life history traits, age profile, and conservation of the panther chameleon, \emph{Furcifer pardalis} ({C}uvier 1829), at {N}osy {B}e, {N}{W} {M}adagascar}, ' ...
'journal = {Tropical Zoology}, ' ...
'volume = {18}, ' ...
'pages = {209-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eckh2018'; type = 'Article'; bib = [ ... 
'author = {Falk Sebastian Eckhardt}, ' ... 
'year = {2018}, ' ...
'title = {Triplet from a single egg in the Panther Chameleon (\emph{Furcifer pardalis})}, ' ...
'journal = {Herpetology Notes, volume}, ' ...
'volume = {11}, ' ...
'pages = {777-779}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Furcifer_pardalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
