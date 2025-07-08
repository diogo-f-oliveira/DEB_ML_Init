function [data, auxData, metaData, txtData, weights] = mydata_Dinarolacerta_mosorensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Dinarolacerta_mosorensis'; 
metaData.species_en = 'Mosor rock lizard'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 04];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'TomaLjub2010';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'TomaLjub2010';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'Wiki';
  comment.Lb = '"less than 3 cm"';
data.Lp  = 5.65;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'TomaLjub2010'; 
data.Li  = 7.0;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'TomaLjub2010'; 
data.Lim = 7.0;    units.Lim = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'guess'; 

data.Wwi = 6.76;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Podarcis muralis: 5.41*(7.0/6.5)^3';

data.Ri  = 3.5*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-8 eggs per clutch, assumed: 3-4 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm): females, males
1	4.328 4.219
1	4.880 4.843
1	4.720 4.604
1	4.778 4.430
1	5.192 4.081
1	5.279 3.878
1	4.379 4.386
1	4.560 4.306
1	4.619 3.987
1	3.443 4.546
1	4.488 4.488
1	4.669 4.735
1	5.054 NaN
1	5.119 NaN
2	6.229 5.924
2	5.997 5.881
2	5.605 5.148
2	5.191 5.039
2	5.699 4.981
2	5.641 6.055
2	5.409 5.569
2	5.358 4.864
2	5.569 5.794
2	5.525 5.736
2	5.467 5.460
2	5.119 5.387
2	4.894 4.770
2	5.794 4.654
2   NaN   5.677
2   NaN   5.627
2   NaN   5.256
2   NaN   5.300
3	5.227 5.604
3	5.735 5.546
3	5.764 5.495
3	5.822 5.706
3	6.011 6.403
3	6.069 6.265
3	6.374 6.199
3	5.648 6.185
3	5.873 6.090
3	5.916 6.025
3	5.437 5.974
3	5.597 5.931
3	6.229 5.887
3   NaN   5.844
3   NaN   5.394
3   NaN   5.299
3   NaN   5.212
4	6.068 6.816
4	5.966 6.170
4	5.916 5.814
4	6.562 6.714
4	6.438 6.641
4	6.344 6.576
4	6.257 6.496
4	6.213 6.438
4	6.112 6.082
4	5.821 6.053
4	5.676 6.010
4   NaN   5.966
4   NaN   6.351
4   NaN   6.307
4   NaN   6.242
5	6.365 6.706
5	5.958 6.837
5	6.285 6.096
5	6.437 6.532
5	6.082 6.619
5	6.191 6.764
5	6.604 6.430
5	6.742 6.459
5	6.866 6.938
5   NaN   6.220
5   NaN   6.292
5   NaN   6.394
6	6.589 7.054
6	6.495 6.930
6	6.923 6.821
6	6.814 6.756
6	6.676 6.720
6	6.204 6.524
6	6.074 6.415
6	6.393 6.676
6	6.313 6.611
6   NaN   6.574
7	6.494 6.835
7	6.617 7.133
7	6.944 6.762
7	6.995 7.060
7	6.175 6.559
7	6.240 6.610
7	6.806 6.697
7   NaN   6.966
8	7.038 7.212
8	6.355 6.914
8   NaN   6.682
8   NaN   7.096
9	7.066 7.262];
data.tL(:,1) = (data.tL(:,1)+0.7) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TomaLjub2010'; treat.tL = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3683R'; % Cat of Life
metaData.links.id_ITIS = '1155255'; % ITIS
metaData.links.id_EoL = '792928'; % Ency of Life
metaData.links.id_Wiki = 'Dinarolacerta_mosorensis'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_mosorensis'; % ADW
metaData.links.id_Taxo = '1685259'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Dinarolacerta&species=mosorensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dinarolacerta_mosorensis}}';
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
bibkey = 'TomaLjub2010'; type = 'Article'; bib = [ ...
'author = {Toma\v{s}evi\''{c} Kolarov, N. and Ljubisavljevi\''{c}, K. and Polovi\''{c}, L. and D\v{z}ukic\''{c}, G. and Kalezi\''{c}, M. L}, ' ... 
'year = {2010}, ' ...
'title = {THE BODY SIZE, AGE STRUCTURE AND GROWTH PATTERN OF THE ENDEMIC BALKAN MOSOR ROCK LIZARD (\emph{Dinarolacerta mosorensis} {K}OLOMBATOVI\''{c}, 1886)}, ' ...
'jpurnal = {Acta Zoologica Academiae Scientiarum Hungaricae}, ' ...
'volume = {56(1)}, ' ...
'pages = {55–71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

