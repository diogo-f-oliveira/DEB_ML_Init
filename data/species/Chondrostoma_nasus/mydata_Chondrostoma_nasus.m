  function [data, auxData, metaData, txtData, weights] = mydata_Chondrostoma_nasus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chondrostoma_nasus'; 
metaData.species_en = 'Common nase'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 14]; 

%% set data
% zero-variate data
data.tp = 5*365;      units.tp = 'd';  label.tp = 'age at puberty for females';    bibkey.tp = 'Beek2007';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';    bibkey.tpm = 'Beek2007';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Beek2007';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Beek2007'; 
data.Lpm = 30;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Beek2007'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'Beek2007';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'Beek2007';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: 4/3*pi*0.075^3';

data.Ri = 1e5/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';           bibkey.Ri = 'Beek2007';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
tL1 = [ ... % time since birth (yr), min/max total length (cm)
 1  8  8
 2 17 23 
 3 23 26
 4 28 34
 5 33 35
 6 34 37
 7 38 39
 8 39 41
15 43 43];
data.tL1 = [365 * tL1(:,1), sum(tL1(:, [2 3]), 2)/ 2];
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'Belgium'};  
temp.tL1 = C2K(17);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Beek2007';
comment.tL1 = 'Belgium';
% 
data.tL2 = [ ... % time since birth (yr), total length (cm)
 1  8.1
 2 16.2
 3 22.3
 4 27.5
 5 31.9
 6 35.5
 7 38.1
14 48.5];
data.tL2(:,1) = 365 * data.tL2(:,1);
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since birth', 'total length', 'South Germany'};  
temp.tL2 = C2K(17);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Beek2007';
comment.tL2 = 'South Germany';
% 
data.tL3 = [ ... % time since birth (yr), total length (cm)
1  5.8
2 11.6
3 17.4
4 20.0
5 24.7
6 32.1
7 40.0];
data.tL3(:,1) = 365 * data.tL3(:,1);
units.tL3 = {'d', 'cm'}; label.tL3 = {'time since birth', 'total length', 'Germany'};  
temp.tL3 = C2K(17);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Beek2007';
comment.tL3 = 'Germany';

% length-weight
data.LW = [... % total length (cm), wet weight (g)
  7    5 
  9    7
 11.5  9.5
 16   20
 17.5 30];
units.LW = {'d', 'cm'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Beek2007';

% temp-age at birth
data.Tab = [ ... % temperature (C), incubation time (d)
10 23.4
12 14.5
14  9.9
16  7.14
18  5.41
20  4.24
22  3.41];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'Beek2007';
comment.Tab = 'Eggs do not develop at <8 and >24 C';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Belgium, South Germany, Germany'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5XZDS'; % Cat of Life
metaData.links.id_ITIS = '639383'; % ITIS
metaData.links.id_EoL = '339806'; % Ency of Life
metaData.links.id_Wiki = 'Chondrostoma_nasus'; % Wikipedia
metaData.links.id_ADW = 'Chondrostoma_nasus'; % ADW
metaData.links.id_Taxo = '43623'; % Taxonomicon
metaData.links.id_WoRMS = '154585'; % WoRMS
metaData.links.id_fishbase = 'Chondrostoma-nasus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chondrostoma_nasus}}';  
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
bibkey = 'Beek2007'; type = 'Techreport'; bib = [ ...  
'author = {J. Beekman}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument sneep, \emph{Chondrostoma nasus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {4}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-sneep_4558.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

