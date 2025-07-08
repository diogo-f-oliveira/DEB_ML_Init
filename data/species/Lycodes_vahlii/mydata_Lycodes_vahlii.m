function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_vahlii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_vahlii'; 
metaData.species_en = 'Vahl''s eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 16];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'Erzi1991';   
  temp.am = C2K(3.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13.4;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'Nash1986'; 
data.Li  = 52;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 0.113;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 6 mm: pi/6*0.6^3';
data.Wwp = 15;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'}; 
  comment.Wwp= 'based on 0.00219*Lp^3.18, see F1';
data.Wwi = 627;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.18, see F1';

  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  4.0
    2  7.5
    3 10.0
    4 12.6
    5 14.8
    6 16.5
    7 17.8
    8 19.5
    9 19.5];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'record 467';
%
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.283	9.628
2.756	9.487
3.668	11.681
3.753	12.850
4.317	11.929
4.816	13.558
5.376	14.549
5.438	13.239
5.820	14.372
6.056	14.230
6.324	13.805
6.379	15.292
6.825	14.478
7.027	16.248
7.387	14.336
7.503	15.221
7.740	15.150
8.034	15.504
8.743	15.823
9.010	15.469
9.988	14.690];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(3.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Nash1986'; comment.tL = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.871	10.973
3.432	11.150
3.520	11.681
3.932	12.496
4.490	14.088
4.872	14.903
5.402	15.681
5.463	14.867
5.871	17.558
5.964	15.788
6.463	17.416
6.901	19.504
7.442	15.858
7.875	20.106
7.968	18.442
8.436	20.708
8.939	20.566
9.029	19.717
9.970	21.947
10.060	21.558];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(3.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Nash1986'; comment.tL = 'data for females';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
13.404	17.760
14.285	26.803
14.703	29.846
15.575	28.802
16.331	18.664
16.524	39.704];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(3.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Nash1986'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00219*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WKYZ'; % Cat of Life
metaData.links.id_ITIS = '165284'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lycodes_vahlii'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_vahlii'; % ADW
metaData.links.id_Taxo = '179383'; % Taxonomicon
metaData.links.id_WoRMS = '127118'; % WoRMS
metaData.links.id_fishbase = 'Lycodes-vahlii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycodes_vahlii}}';
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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nash1986'; type = 'article'; bib = [ ... 
'doi = {10.1080/00364827.1986.10419698}, ' ...
'volume = {71(3-4)}, ' ...}, ' ...
'author = {Nash, R. D. M.}, ' ... 
'year = {1986}, ' ...
'title = {Aspects of the general biology of {V}ahl''s eelpout, \emph{Lycodes vahlii gracilis} {M}. {S}ars, 1867 ({P}isces, {Z}oarcidae), in {O}slofjorden, {N}orway}, ' ...
'journal = {Sarsia}, ' ...
'pages = {289–296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lycodes-vahlii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
