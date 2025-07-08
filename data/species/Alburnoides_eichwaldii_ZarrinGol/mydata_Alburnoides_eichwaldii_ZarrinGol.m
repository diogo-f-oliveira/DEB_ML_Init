  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_eichwaldii_ZarrinGol

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_eichwaldii_ZarrinGol'; 
metaData.species_en = 'Caspian Spirlin'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour-Poodeh'};        
metaData.date_subm = [2022 01 24];                           
metaData.email    = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Gorgan University of Agricultural Sciences and Natural Resources'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2022 01 29]; 

%% set data
% zero-variate data
data.ah = 3;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'guess'; 
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'guess on the basis of Alburnoides_bipunctatus data with ah = 3 ';
data.ab = 10;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess on the basis of Rutilus rutilus, BeekEmme2007';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'EsmaRahm2010';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'EsmaRahm2010';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'EsmaRahm2010';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'fishbase'; 
data.Lp = 8.3;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'EsmaRahm2010'; 
data.Lpm = 4;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'EsmaRahm2010'; 
data.Li = 11.7;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'EsmaRahm2010';

data.Wwb = 3.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'BeekEmme2007';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';

data.Ri = 81500/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'EsmaRahm2010';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.5 5.42
1 6.81
2 8.75
3 10.27];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 148/135; % convert fork to total length, base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EsmaRahm2010';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.5 1.69
1 3.78
2 8.21
3 13.12];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EsmaRahm2010';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
5.7	2.121
6.1	2.531
7.1	4.863
6.9	3.394
7.8	6.041
8	6.314
8	7.102
7.8	6.407
6	2.184
6.2	2.696
6.1	2.443
6.4	3.236
6.5	3.136
6.4	3.353
6.7	3.871
6.9	4.317
7.2	4.395
7.2	3.58
7.2	4.327
8.6	8.592
9.2	9.609
8.7	7.277
9.5	10.723
8.9	9.87
9	8.795
9.6	10.719
8.1	6.838
8.1	6.778
8.3	7.588
8.2	6.911
8.5	6.078
8.6	7.588
8.9	6.951
8.6	8.555
9	9.818
9.4	9.796
9.7	14.062
9.8	12.793
10.3	13.763
10.4	15.924
10.2	8.886
11.7	18.819
4.7	1.07
4.9	1.135
5.6	1.815
5.3	1.476
5.7	1.964
5.5	2.1199
5.8	1.89
5.6	1.706
6	2.743
6.1	3.084
6	2.556
6.7	3.589
7	4.238
7.4	3.898
7.2	5.641
6.4	3.221
6.5	2.967
6.5	3.537
6.6	3.501
7	3.563
6.8	4.265
7.7	6.167
6	1.937
6.1	2.545
6.3	1.919
6.4	2.68
6.6	3.339
6.7	4.366
6.8	3.434
7.2	3.62
7.1	3.788
7.2	3.583
7.6	4.726
7.6	5.792
6.8	3.47
8.5	8.68
8.6	7.635
9.1	10.224
9.1	9.737
8.1	7.359
8.4	7.766
8.9	7.612
8.7	7.683
8.9	7.291
8.9	7.291
8.6	7.211
11.2	18.56
9.7	8.31
9.7	7.5
10	12.639];
data.LW(:,1) = data.LW(:,1) * 148/135; % convert fork to total length, based on photo
units.LW = {'d', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'EsmaRahm2010';

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

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '66875'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '14015831'; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_eichwaldii'; % Wikipedia
metaData.links.id_ADW = 'Alburnoides_eichwaldii'; % ADW
metaData.links.id_Taxo = '1682598'; % Taxonomicon
metaData.links.id_WoRMS = '1013089'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-eichwaldii'; % fishbase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EsmaRahm2010'; type = 'phdthesis'; bib = [ ...  
'author = {Esmaeilpour Poodeh, S. and Rahmani H}, ' ...
'year = {2010}, ' ...
'title  = {A survey on population dynamic of Caspian Spirlin (\emph{Alburnoides eichwaldii}) in ZarrinGol, Iran}, ' ...
'school = {Gorgan university of Agricultural Sciences and Natural Resources, Iran}, ' ...
'pages = {190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeekEmme2007'; type = 'Techreport'; bib = [ ...  
'author = {J. Beekman and W. A. M. van Emmerik}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument blankvoorn \emph{Rutilus rutilus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {3}, '...
'howpublished = {\url{http://www.sportvisserijnederland.nl/files/kennisdocument-gestippelde-alver_4550.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Alburnoides-eichwaldii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];