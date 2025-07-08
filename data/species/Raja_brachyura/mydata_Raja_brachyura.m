function [data, auxData, metaData, txtData, weights] = mydata_Raja_brachyura

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_brachyura'; 
metaData.species_en = 'Blonde ray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data;
data.ab = 7*30.5; units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'iucn';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed for all data';
data.ap = 2009;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'AnAge';
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Anage';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'sharktrust';
data.Li  = 120;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 7865; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Anage';
  comment.Wwi = 'fishbase: 14300 g'; 

data.Ri  = 30/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'iucn';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.995	36.723
1.254	41.055
1.547	41.055
2.013	46.704
2.564	54.237
2.787	60.264
3.012	57.815
3.184	61.770
3.460	65.537
3.755	61.017
3.978	66.855
4.202	72.316
4.513	70.245
4.977	82.674
5.202	82.486
5.477	86.629
5.753	88.889
5.926	86.441
6.513	89.454
6.737	93.785
6.963	82.863
7.168	96.422
7.480	90.395
7.702	103.013
8.241	83.239
8.720	112.241
9.152	106.968
10.137	105.838];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(12); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hold1972';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.220	36.911
1.460	45.009
1.995	48.023
2.254	51.601
2.530	50.847
2.892	55.744
3.029	59.134
3.290	53.107
3.478	63.842
3.804	72.128
4.013	64.595
4.237	64.783
4.530	73.446
4.720	73.823
4.962	71.940
5.236	81.168
5.514	71.186
5.736	86.441
5.996	82.298
6.513	90.772
6.738	87.571
6.960	100.753
7.720	98.682
7.979	98.870
8.237	105.273];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(12); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hold1972';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f', 'tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6WRN6'; % Cat of Life
metaData.links.id_ITIS = '160880'; % ITIS
metaData.links.id_EoL = '46560573'; % Ency of Life
metaData.links.id_Wiki = 'Raja_brachyura'; % Wikipedia
metaData.links.id_ADW = 'Raja_brachyura'; % ADW
metaData.links.id_Taxo = '42068'; % Taxonomicon
metaData.links.id_WoRMS = '367297'; % WoRMS
metaData.links.id_fishbase = 'Raja-brachyura'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raja_(genus)}}';   % replace my_pet by latin species name
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
bibkey = 'Hold1972'; type = 'Article'; bib = [ ... 
'author = {M. J. Holden}, ' ...
'year = {1972}, ' ...
'title  = {The growth rates of \emph{Raja brachyura}, \emph{R. clavata} and \emph{R. montaqui} as determined from tagging data.}, ' ...
'journal = {J. Physiol. (Lond.)}, ' ...
'volume = {34}, ' ...
'pages = {161--168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sharktrust'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sharktrust.org/shared/id_guides/blonde_ray_st_id_guide.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/161691/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Raja-brachyura.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Raja_brachyura}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
