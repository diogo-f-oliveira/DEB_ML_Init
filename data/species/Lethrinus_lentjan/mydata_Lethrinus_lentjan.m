function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_lentjan
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_lentjan'; 
metaData.species_en = 'Pink ear emperor'; 

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

data.am = 19*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 52;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm : pi/6*0.07^3'; 

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'DegoAli2013';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.028	0.279
0.994	11.379
1.973	19.616
3.007	26.178
4.027	29.878
4.990	33.368
6.009	36.300
7.014	38.604];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wass1991';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
   11  20.25
   13  31.00
   16  64.00
   17  73.00
   18  85.00
   19 101.33
   20 108.67
   21 129.56
   22 140.67
   23 160.59
   24 184.00
   25 206.80
   26 238.67
   27 265.83
   28 294.77
   29 319.77
   30 354.71
   31 398.14
   32 427.83
   33 470.38
   34 556.67
   35 641.67
   36 680.00
   37 710.00
   38 784.00
   40 813.00
   41 845.00
   42 880.00];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'female'};  
bibkey.LW_f = 'Wass1991';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
    8   7.00
    9  10.00
   10  14.25
   11  19.50
   20 112.0
   21 128.75
   22 141.17
   23 159.80
   24 185.00
   25 221.56
   26 249.40
   27 269.33
   28 289.57
   29 317.50
   30 350.42
   31 391.00
   32 427.70
   33 466.83
   34 556.86
   35 631.00
   36 680.00
   37 700.00
   38 806.50
   39 806.50
   41 822.00];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'male'};  
bibkey.LW_m = 'Wass1991';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 8;

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

%% Discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'protogynous hermaphrodite';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 10 - 90 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6Q2Q8'; % Cat of Life
metaData.links.id_ITIS = '169148'; % ITIS
metaData.links.id_EoL = '46580938'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_lentjan'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_lentjan'; % ADW
metaData.links.id_Taxo = '178742'; % Taxonomicon
metaData.links.id_WoRMS = '212061'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-lentjan'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_lentjan}}';
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
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-lentjan.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
