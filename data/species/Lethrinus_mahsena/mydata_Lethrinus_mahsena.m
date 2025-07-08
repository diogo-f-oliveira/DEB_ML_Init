function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_mahsena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_mahsena'; 
metaData.species_en = 'Sky emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 09]; 

%% set data
% zero-variate data

data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 65; units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.335 mm of Lethrinus_mahsena: pi/6*0.0335^3'; 

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'DegoAli2013';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'size is not specified';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.043	0.279
1.050	10.052
2.000	16.405
3.006	23.176
3.998	28.761
5.032	32.042
6.051	35.462
6.985	38.045];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wass1991';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
  17   75.00
  18   91.33
  19  102.50
  21  137.00
  22  175.00
  23  186.50
  24  215.86
  25  247.50
  26  268.40
  27  288.75
  28  331.52
  29  378.71
  30  428.27
  31  455.90
  32  530.80
  33  582.86
  34  641.38
  35  687.00
  36  730.57
  37  755.20
  38  819.97
  39  833.00
  40  856.00
  42  913.33
  44  992.50
  46 1030.00];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'female'};  
bibkey.LW_f = 'Wass1991';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
  15   56
  21  141.00
  22  165.00
  23  194.00
  24  220.38
  25  258.50
  26  274.00
  27  287.86
  28  323.33
  29  370.00
  30  427.14
  31  432.14
  32  500.10
  33  556.67
  35  671.17
  36  704.50
  37  741.67
  38  817.50
  39  830.0
  40  850.00
  41  780.00
  42  906.00
  47 1090.00];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'male'};  
bibkey.LW_m = 'Wass1991';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Probably protogynous hermaphrodite';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 10 - 90 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '72328'; % Cat of Life
metaData.links.id_ITIS = '169141'; % ITIS
metaData.links.id_EoL = '46580948'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_mahsena'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_mahsena'; % ADW
metaData.links.id_Taxo = '178743'; % Taxonomicon
metaData.links.id_WoRMS = '212075'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-mahsena'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_mahsena}}';
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
bibkey = 'Wass1991'; type = 'Article'; bib = [ ... 
'author = {E. A. Wassef}, ' ... 
'year = {1991}, ' ...
'title = {Comparative growth studies on \emph{Lethrinus lentjan}, Lac\''{e}p\`{e}de 1802 and Lethrinus mahsena, Forssk{\aa}l 1775 ({P}isces, {L}ethrinidae) in the {R}ed {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {11}, ' ...
'pages = {75--92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-mahsena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
