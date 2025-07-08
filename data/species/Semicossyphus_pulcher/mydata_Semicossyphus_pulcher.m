function [data, auxData, metaData, txtData, weights] = mydata_Semicossyphus_pulcher 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Semicossyphus_pulcher'; 
metaData.species_en = 'California sheephead'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dorra Louati'};
metaData.date_subm = [2015 03 26]; 
metaData.email    = {'dorra.louati@ird.fr'}; 
metaData.address  = {'Intitut Pasteur de Tunis, 1002, Tunisia'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 04 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 25]; 

%% set data
% zero-variate data

data.ab = 2;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'JirsDraw2007';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4*365;   units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'ADW';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 53*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JirsDraw2007';  
data.Lp  = 30.1;     units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 100;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'ADW';

data.Wwp = 800;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'ADW';
data.Wwi = 16e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 8.5e4;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'JirsDraw2007';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.94e6 eggs per kg per yr: 1.94e6*16/365';

% univariate data
data.tL = [ ... % time since birth (yr), forklength (cm) 
1.024	12.917
2.027	18.333
3.030	22.917
4.016	28.333
5.000	28.646
6.038	31.667
7.023	33.854
8.008	38.333
9.029	42.708
10.014	47.188
11.016	48.333
13.021	53.750];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlonKey2004';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Between 5 and 13 yr, females may change to males; all are born as female';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WG9W'; % Cat of Life
metaData.links.id_ITIS = '170744'; % ITIS
metaData.links.id_EoL = '46572180'; % Ency of Life
metaData.links.id_Wiki = 'Semicossyphus_pulcher'; % Wikipedia
metaData.links.id_ADW = 'Semicossyphus_pulcher'; % ADW
metaData.links.id_Taxo = '187392'; % Taxonomicon
metaData.links.id_WoRMS = '282753'; % WoRMS
metaData.links.id_fishbase = 'Semicossyphus-pulcher'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Semicossyphus_pulcher}}';
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
bibkey = 'JirsDraw2007'; type = 'Article'; bib = [ ... 
'author = {Jirsa, D. and Drawbridge, M. and Stuart, K.}, ' ... 
'year = {2007}, ' ...
'title = {Spawning of a Captive Population of {C}alifornia Sheephead, \emph{Semicossyphus pulcher}}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {38}, ' ...
'number = {1}, '...
'pages = {122--128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Semicossyphus-pulcher.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Semicossyphus_pulcher/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlonKey2004'; type = 'Techreport'; bib = [ ... 
'author = {Alonzo, S. H. and Key, M. and Ish, T. and MacCall, A. D.}, ' ... 
'year = {2004}, ' ...
'title = {Status of the {C}alifornia Sheephead (\emph{Semicossyphus pulcher}) stock.}, ' ...
'institution = {Center for Stock Assessment Research (CSTAR) and the Institute of Marine Sciences, University of California Santa Cruz.}, ' ...
'howpublished = {\url{https://users.soe.ucsc.edu/~msmangel/Sheephead final.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

