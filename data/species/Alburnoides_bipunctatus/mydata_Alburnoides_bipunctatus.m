  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_bipunctatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_bipunctatus'; 
metaData.species_en = 'Schneider'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 13]; 

%% set data
% zero-variate data
data.ab = 10;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'BeekEmme2005'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d';
data.tp = 3*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'BeekEmme2005';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'BeekEmme2005';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'BeekEmme2005';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'BeekEmme2005';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BeekEmme2005';
  comment.Wwb = 'Based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';
data.Wwi = 30; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'BeekEmme2005';

data.Ri = 5e3/365;   units.Ri = '#/d';  label.Ri = 'Max reprod rate';    bibkey.Ri = 'BeekEmme2005';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1  4.8
2  6.4
3  7.9
4  8.7
5  9.6
6 10.4
7 11.0
8 12.2
9 12.9];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'Poland'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BeekEmme2005';
comment.tL = 'Data from Poland';
%
data.tL1 = [ ... % time since birth (yr), total length (cm)
1  2.63
2  5.45
3  7.28
4  8.28
5  9.08
6 10.08];
data.tL1(:,1) = 365 * data.tL1(:,1);
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'Siebenburgisch Bach'};  
temp.tL1 = C2K(16);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BeekEmme2005';
comment.tL1 = 'Data from Siebenburgisch Bach';

% length-weight
data.LW = [ ... % total length (cm), wet weight
 2  0.05
 4  0.45
 6  1.70
 8  4.33
10  8.98
12 16.2
14 27.0];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'BeekEmme2005';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL', 'tL1'}; subtitle1 = {'Data for Gernamy, Poland'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '65W6T'; % Cat of Life
metaData.links.id_ITIS = '163714'; % ITIS
metaData.links.id_EoL = '46581710'; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_bipunctatus'; % Wikipedia
metaData.links.id_ADW = 'Alburnoides_bipunctatus'; % ADW
metaData.links.id_Taxo = '43608'; % Taxonomicon
metaData.links.id_WoRMS = '154288'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-bipunctatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnoides_bipunctatus}}';  
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
bibkey = 'BeekEmme2005'; type = 'Techreport'; bib = [ ...  
'author = {J. Beekman and W. A. M. van Emmerik}, ' ...
'year = {2005}, ' ...
'title = {gestippelde alver \emph{Alburnoides bipunctatus} ({B}loch, 1782)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {3}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-gestippelde-alver_4550.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

