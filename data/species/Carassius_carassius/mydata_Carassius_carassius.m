  function [data, auxData, metaData, txtData, weights] = mydata_Carassius_carassius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Carassius_carassius'; 
metaData.species_en = 'Crucian carp'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-ah'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 14]; 

%% set data
% zero-variate data
data.tp = 4.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'Wijm2009';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';   bibkey.tpm = 'Wijm2009';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Wijm2009';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.5;    units.Lh = 'cm'; label.Lh = 'total length at hatch';            bibkey.Lh = 'Wijm2009'; 
data.Lb = 0.725;    units.Lb = 'cm'; label.Lb = 'total length at birth';          bibkey.Lb = 'Wijm2009'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Wijm2009';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Wijm2009';
  comment.Wwb = 'based on egg diameter of 1 mm: 4/3*pi*0.05^3';

data.Ri = 5e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';               bibkey.Ri = 'Wijm2009';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.466	4.262
1.485	8.525
2.504	11.616
3.469	13.958
4.476	15.035
5.468	17.049
6.476	17.002
7.483	17.892
8.463	18.220];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wijm2009';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.510	15.421
1.501	70.093
2.479	122.664
3.498	166.822
4.477	192.056
5.485	187.150
6.464	213.785
7.468	285.280
8.490	278.972];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Wijm2009';

% temperature - incubation
data.Tah = [ ... temperature (C), incubation time (d)
15   7
18.5 6
26   3];
units.Tah = {'C', 'd'}; label.Tah = {'temperature', 'age at hatch'};  
bibkey.Tah = 'Wijm2009';
comment.Tah = 'No hatch at <10 and >30 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'The high maintenance, compared to other family members, is probably linked to farming selection, to boost production';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = 'R32J'; % Cat of Life
metaData.links.id_ITIS = '163352'; % ITIS
metaData.links.id_EoL = '205155'; % Ency of Life
metaData.links.id_Wiki = 'Carassius_carassius'; % Wikipedia
metaData.links.id_ADW = 'Carassius_carassius'; % ADW
metaData.links.id_Taxo = '43897'; % Taxonomicon
metaData.links.id_WoRMS = '154297'; % WoRMS
metaData.links.id_fishbase = 'Carassius-carassius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carassius_carassius}}';  
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
bibkey = 'Wijm2009'; type = 'Techreport'; bib = [ ...  
'author = {P. A. D. M. Wijmans}, ' ...
'year = {2009}, ' ...
'title = {Kennisdocument kroeskarper, \emph{Carassius carassius} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {30}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-kroeskarper_5537.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/270}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

