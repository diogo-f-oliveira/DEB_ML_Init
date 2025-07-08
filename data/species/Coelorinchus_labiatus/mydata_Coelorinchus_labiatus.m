function [data, auxData, metaData, txtData, weights] = mydata_Coelorinchus_labiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coelorinchus_labiatus'; 
metaData.species_en = 'Spearsnouted grenadier'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];


%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length as Nezumia_sclerorhynchus';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm of Coryphaenoides rupestris: 4/3*pi*0.13^3';
data.Wwp = 41.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00251*Lp^3.19, see F1';  
data.Wwi = 660;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00251*Li^3.19, see F1';

data.Ri  = 6.5e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(6.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on same weight-specific rate, compared to Coryphaenoides rupestris: (50/110)^3*68780 per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), pre-anal length (cm)
0.970	3.726
0.995	3.602
1.008	3.513
1.015	4.689
1.030	4.136
2.036	5.136
2.037	4.691
3.004	6.136
3.006	5.673
3.924	7.064
3.961	7.064
3.986	7.011
4.015	6.066
4.021	7.528
4.901	9.062
4.932	7.512
4.934	7.084
4.950	9.080
4.957	7.530
4.959	7.048
4.967	8.064
4.984	7.031
5.008	7.031
5.014	5.587
5.917	7.549
5.926	8.529
5.927	8.529
5.928	8.048
5.963	8.529
5.967	7.549
5.973	6.088
5.977	8.030
5.987	5.571
5.989	8.048
5.997	9.028
6.028	7.531
6.063	8.031
6.901	7.996
6.922	9.084
6.938	8.014
6.954	7.088
6.962	8.014
6.983	9.066
6.985	8.531
7.015	7.052
7.024	8.014
7.048	8.032
7.900	7.606
7.923	7.998
7.935	8.016
7.937	7.606
7.962	7.571
8.030	8.979
8.932	8.071
9.965	8.608
9.982	7.503];
data.tL(:,1) = 365*(0.7+data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)*2.94; % convert PAL to TL, see F2
data.tL(:,2) = 3.54*data.tL(:,2); % convert pre-anal length to total length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MassuMora1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'with the used TL-PAL conversion, ultimate TL is larger than value from fishbase';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00251*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 2.94*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,  'F2',F2);

%% Links
metaData.links.id_CoL = 'WST4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46564820'; % Ency of Life
metaData.links.id_Wiki = 'Coelorinchus_labiatus'; % Wikipedia
metaData.links.id_ADW = 'Coelorinchus_labiatus'; % ADW
metaData.links.id_Taxo = '325234'; % Taxonomicon
metaData.links.id_WoRMS = '280299'; % WoRMS
metaData.links.id_fishbase = 'Coelorinchus-labiatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coelorinchus}}';
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
bibkey = 'MassuMora1995'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0967-0637(95)00003-o}, ' ...
'author = {Massut\''{i}, E. and Morales-Nin, B. and Stefanescu, C.}, ' ... 
'year = {1995}, ' ...
'title = {Distribution and biology of five grenadier fish ({P}isces: {M}acrouridae) from the upper and middle slope of the northwestern {M}editerranean}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'volume = {42(3)}, ' ...
'pages = {307–330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Coelorinchus-labiatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

