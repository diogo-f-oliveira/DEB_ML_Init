  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_laurettae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_laurettae'; 
metaData.species_en = 'Bering cisko'; 

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
data.am = 9*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Alt1973'; 
  comment.Lp = 'based on tp 4 yr and tL data';
data.Li = 48;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 113;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Alt1973'};
  comment.Wwp = 'based on 0.00537*Lp^3.22, see F1';
data.Wwi = 1.39e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.22, see F1';
    
data.Ri = 5e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Coregonus pidschian, which has similar size';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
4.026	33.264
4.027	35.617
4.059	33.852
4.059	34.264
4.060	35.205
4.076	34.735
4.078	37.382
4.091	31.734
5.028	37.784
5.042	32.666
5.058	32.254
5.059	33.254
5.060	34.784
5.060	35.196
5.060	35.607
5.061	37.254
5.072	27.666
5.076	34.195
5.079	38.313
5.079	38.842
5.111	36.195
6.013	39.892
6.028	37.774
6.028	38.186
6.043	34.598
6.043	35.245
6.044	36.362
6.045	37.362
6.058	32.186
6.062	39.127
6.063	40.362
6.063	40.833
6.075	33.186
6.079	38.656
6.094	36.891
7.045	38.117
7.045	38.588
7.046	40.353
7.048	43.764
7.064	41.117
7.064	41.705
7.068	47.823
7.078	37.764
7.079	39.235
7.079	39.823
7.081	42.176
8.064	41.166
8.065	42.872
8.065	43.754
8.083	45.813
8.084	47.166
8.084	48.342];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.94; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'Hess Creek'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Alt1973';
comment.tL = 'Data from Hess Creek';
%
data.tL1 = [ ... % time since birth (yr), fork length (cm)
3.020	23.745
3.021	26.039
3.037	24.274
4.023	29.676
4.055	26.735
4.070	24.088
4.087	25.323
5.038	26.784
5.091	30.666
6.055	26.127
6.057	30.186
6.057	30.656
6.094	35.774
7.093	35.176];
data.tL1(:,1) = 365 * (0.9 + data.tL1(:,1)); % convert yr to d
data.tL1(:,2) = data.tL1(:,2)/ 0.94; % convert FL to TL
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'Port Clarence-Grantley Harbor'};  
temp.tL1 = C2K(6);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Alt1973';
comment.tL1 = 'Data from Port Clarence-Grantley Harbor';

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
set1 = {'tL','tL1'}; subtitle1 = {'Data from Hess Creek, Port Clarence-Grantley Harbor'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00537*(TL in cm)^3.22'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.94*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6B28W'; % Cat of Life
metaData.links.id_ITIS = '161935'; % ITIS
metaData.links.id_EoL = '46563173'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_laurettae'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_laurettae'; % ADW
metaData.links.id_Taxo = '171715'; % Taxonomicon
metaData.links.id_WoRMS = '254567'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-laurettae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_laurettae}}';  
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
bibkey = 'Alt1973'; type = 'Article'; bib = [ ...  
'author = {Kenneth T. Alt}, ' ...
'year = {1973}, ' ...
'title = {Contributions to the Biology of the {B}ering Cisco (\emph{Coregonus laurettae}) in {A}laska}, ' ... 
'journal = {J. Fish. Res. Board Canada}, ' ...
'pages = {1885-1888}, ' ...
'volume = {30(12)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-laurettae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

