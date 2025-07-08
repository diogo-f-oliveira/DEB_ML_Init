  function [data, auxData, metaData, txtData, weights] = mydata_Abramis_brama

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Abramis_brama'; 
metaData.species_en = 'Common bream'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 13]; 

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'Emme2008'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;      units.tp = 'd';  label.tp = 'age at puberty for females';    bibkey.tp = 'Emme2008';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';    bibkey.tpm = 'Emme2008';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Emme2008';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Emme2008'; 
data.Lpm = 25;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Emme2008'; 
data.Li = 72;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'Emme2008';

data.Wwb = 2.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'Emme2008';
  comment.Wwb = 'Based on egg diameter of 1.75 mm: 4/3*pi*0.087^3';
data.Wwp = 319;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';bibkey.Wwp = 'Emme2008';
  comment.Wwp = 'Computed as Wwi * (Lp/ Li)^3';
data.Wwpm = 253;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';bibkey.Wwpm = 'Emme2008';
  comment.Wwpm = 'Computed as Wwi * (Lpm/ Li)^3';
data.Wwi = 6.05e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'Emme2008';

data.Ri = 1e6/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';           bibkey.Ri = 'Emme2008';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
 1  4.6
 2  8.1
 3 11.3
 4 14.0
 5 16.3
 6 18.7
 7 20.4
 8 22.0
 9 23.4
10 24.8
11 26.2
12 27.1
13 28.9
14 29.6
15 29.4];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
data.tL_f(:,2) = 1.2 * data.tL_f(:,2); % convert standard to total length, based on photo
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZhanXiel2016';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (yr), standard length (cm)
 1  4.6
 2  8.1
 3 11.6
 4 13.5
 5 16.3
 6 18.5
 7 20.4
 8 21.9
 9 23.4
10 24.7
11 25.9
12 26.8
13 28.0];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = 1.2 * data.tL_m(:,2); % convert standard to total length, based on photo
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZhanXiel2016';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.004606 * (FL in cm)3.2345';
metaData.bibkey.F1 = 'Emme2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '63ZV8'; % Cat of Life
metaData.links.id_ITIS = '163666'; % ITIS
metaData.links.id_EoL = '46581641'; % Ency of Life
metaData.links.id_Wiki = 'Abramis_brama'; % Wikipedia
metaData.links.id_ADW = 'Abramis_brama'; % ADW
metaData.links.id_Taxo = '43605'; % Taxonomicon
metaData.links.id_WoRMS = '154281'; % WoRMS
metaData.links.id_fishbase = 'Abramis-brama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Abramis_brama}}';  
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
bibkey = 'Emme2008'; type = 'Techreport'; bib = [ ...  
'author = {W. A. M. van Emmerik}, ' ...
'year = {2008}, ' ...
'title = {Kennisdocument brasem \emph{Abramis brama} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {23}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-brasem_5023.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanXiel2016'; type = 'Article'; bib = [ ...  
'author = {Z.-M. Zhang and C.-X. Xie and H.-P. Ding and C.-J. Liu and X.-F. Ma and L.-G. Ca}, ' ...
'year = {2016}, ' ...
'title = {Age and growth of bream \emph{Abramis brama} ({L}innaeus, 1758) in the downstream section of {I}rtysh {R}iver in {C}hina}, ' ... 
'journal = {Applied Ichtyology}, ' ...
'volume = {32}, '...
'pages = {105-109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

