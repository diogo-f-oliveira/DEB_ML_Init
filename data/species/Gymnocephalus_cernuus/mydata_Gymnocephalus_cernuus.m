  function [data, auxData, metaData, txtData, weights] = mydata_Gymnocephalus_cernuus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Gymnocephalus_cernuus'; 
metaData.species_en = 'Ruffe'; 

metaData.ecoCode.climate = {'Cfa', 'Dfc', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp', '0iFe'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 17]; 

%% set data
% zero-variate data
data.ab = 15;        units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'Emme2004'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females';    bibkey.tp = 'Emme2004';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Emme2004';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.65;  units.Lb = 'cm'; label.Lb = 'total length at birth';  bibkey.Lb = 'Emme2004'; 
data.Lp = 7;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Emme2004'; 
data.Lpm = 6;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Emme2004'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'Emme2004';

data.Wwb = 5.23e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Emme2004';
  comment.Wwb = 'Based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 225; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Emme2004';

data.Ri = 2e5/365;   units.Ri = 'g';  label.Ri = 'reprod rate max size';         bibkey.Ri = 'Emme2004';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
% females
data.tL = [ ... % time since birth (yr), total length (cm)
0	4.244
1	9.375
2	13.246
3	16.192
4	18.550
5	20.152
6	21.376
7	22.432];
data.tL(:,1) = 365 * (.6 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'lakes'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Emme2004';
comment.tL = 'Data for lakes';
% estuaries
data.tL1 = [ ... % time since birth (yr), total length (cm)
0	2.773
1	5.845
2	8.204
4	10.310
5	11.954
4.992	13.346
5.974	14.527
6.976	15.289];
data.tL1(:,1) = 365 * (.6 + data.tL1(:,1));  % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'estuaries'};  
temp.tL1 = C2K(16);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Emme2004';
comment.tL1 = 'Data for estuaries';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
0.035	0.674
5.043	1.513
9.983	12.758
15.060	46.838
20.000	118.18];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Emme2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;
weights.Ri = 3 * weights.Ri;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL', 'tL1'}; subtitle1 = {'Data for lakes, estuaries'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3HQWP'; % Cat of Life
metaData.links.id_ITIS = '168520'; % ITIS
metaData.links.id_EoL = '203972'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocephalus_cernua'; % Wikipedia
metaData.links.id_ADW = 'Gymnocephalus_cernua'; % ADW
metaData.links.id_Taxo = '45187'; % Taxonomicon
metaData.links.id_WoRMS = '405451'; % WoRMS
metaData.links.id_fishbase = 'Gymnocephalus-cernua'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gymnocephalus_cernuus}}';  
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
bibkey = 'Emme2004'; type = 'Techreport'; bib = [ ...  
'author = {W. A. M. van Emmerik}, ' ...
'year = {2004}, ' ...
'title = {Kennisdocument pos, \emph{Gymnocephalus cernuus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {5}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-snoekbaars_4560.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
