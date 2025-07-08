  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_pidschian
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_pidschian'; 
metaData.species_en = 'Humpback whitefish'; 

metaData.ecoCode.climate = {'Dfc','ET','ME'};
metaData.ecoCode.ecozone = {'TH','MN'};
metaData.ecoCode.habitat = {'0iFr','jiMc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 11]; 

%% set data
% zero-variate data
data.am = 14*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 50;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 53.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00550*Lp^3.24, see F1';
data.Wwi = 1.76e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.24, see F1';
    
data.Ri = 5e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1.045	14.907
2.056	19.560
3.049	27.992
4.077	30.593
5.021	35.353
6.049	38.710
7.026	45.630
7.988	47.691];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.94; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'Verkhny Vilyuy River, East Siberia'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BochZuyk2018';
comment.tL = 'Data from Verkhny Vilyuy River, East Siberia';
%
data.tL1 = [ ... % time since birth (yr), fork length (cm)
1.029	12.747
2.006	18.047
3.034	21.728
4.046	24.545
5.024	27.902
6.035	30.827
7.014	33.643
7.976	36.136
9.053	39.493
10.032	41.878
10.994	43.398
12.005	47.727];
data.tL1(:,1) = 365 * (0.9 + data.tL1(:,1)); % convert yr to d
data.tL1(:,2) = data.tL1(:,2)/ 0.94; % convert FL to TL
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'Khroma River, Siberia'};  
temp.tL1 = C2K(6);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BochZuyk2018';
comment.tL1 = 'Data from Khroma River, Siberia';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Verkhny Vilyuy, Khroma River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
D2 = 'Asymptotic length is problaby twice the maximum observed length; growth is fast at max age';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.00550*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.94*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'YDB7'; % Cat of Life
metaData.links.id_ITIS = '161958'; % ITIS
metaData.links.id_EoL = '46563174'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_pidschian'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_pidschian'; % ADW
metaData.links.id_Taxo = '42849'; % Taxonomicon
metaData.links.id_WoRMS = '254568'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-pidschian'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_pidschian}}';  
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
bibkey = 'BochZuyk2018'; type = 'Article'; bib = [ ...  
'author = {N. A. Bochkarev and E. I. Zuykova and L. A. Pestryakova and E. S. Zakharov and V. I. Romanov and V. V. Sokolov and D. V. Politov}, ' ...
'year = {2018}, ' ...
'title = {Siberian Whitefish (\emph{Coregonus lavaretus pidschian}, {C}oregonidae) from the {A}nabar {R}iver: Morphogenetic Structure of the Population}, ' ... 
'journal = {Russian Journal of Genetics}, ' ...
'pages = {1078-1088}, ' ...
'volume = {54(9)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-pidschian.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

