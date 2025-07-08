  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_latipinnis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_latipinnis'; 
metaData.species_en = 'Flannelmouth sucker'; 

metaData.ecoCode.climate = {'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 17]; 

%% set data
% zero-variate data
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 43.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'McAdWydo1985'; 
  comment.Lp = '15 inch';
data.Lpm = 42.8;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'McAdWydo1985'; 
  comment.Lpm = '14.5 inch';
data.Li = 56;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 7.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'McAdWydo1985';
  comment.Wwb = 'Computed from egg diameter of 2.39 mm: pi/6*0.239^3';
data.Wwi = 1.38e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'McAdWydo1985';
  comment.Wwi = 'based on exp(3.09*(log(Li) - 5.21), see F1';

data.Ri = 4e4/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL = 50 cm';    bibkey.Ri = 'McAdWydo1985';
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
0.967	7.113
1.917	14.040
2.935	25.950
3.955	36.199
4.998	43.681
5.971	45.627
6.982	47.297
7.994	48.783
8.985	51.559];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McAdWydo1985';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = exp(3.09*(log(TL in cm) - 5.21)';
metaData.bibkey.F1 = 'McAdWydo1985'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RW4M'; % Cat of Life
metaData.links.id_ITIS = '163906'; % ITIS
metaData.links.id_EoL = '207062'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_latipinnis'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_latipinnis'; % ADW
metaData.links.id_Taxo = '166647'; % Taxonomicon
metaData.links.id_WoRMS = '1383080'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-latipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_latipinnis}}';  
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
bibkey = 'McAdWydo1985'; type = 'Article'; bib = [ ...  
'author = {Charles W. McAda and Richard S. Wydoski}, ' ...
'year = {1985}, ' ...
'title = {GROWTH AND REPRODUCTION OF THE FLANNELMOUTH SUCKER, \emph{Catostomus latipinnis}, IN THE UPPER {C}OLORADO {R}IVER BASIN, 1975-76}, ' ... 
'journal = {The Great Basin Naturalist}, ' ...
'volume = {45}, '...
'pages = {281-286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-latipinnis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
