  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_eichwaldii_ShirAbad

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_eichwaldii_ShirAbad'; 
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
  temp.ah = C2K(17); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'guess on the basis of Alburnoides_bipunctatus data with ah = 3 ';
data.ab = 10;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess on the basis of Rutilus rutilus, BeekEmme2007';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'AbbaGhor2010';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'AbbaGhor2010';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'AbbaGhor2010';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'fishbase'; 
data.Lp = 8.54;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'AbbaGhor2010'; 
data.Lpm = 9.64;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'AbbaGhor2010'; 
data.Li = 12.47;    units.Li = 'cm'; label.Li = 'ultimate total length';          bibkey.Li = 'AbbaGhor2010';

data.Wwb = 3.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'BeekEmme2007';
  comment.Wwb = 'Based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';

data.Ri = 8060/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'AbbaGhor2010';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.5 5.15
1 7.14
2 8.73
3 9.96];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 148/135; % convert fork to total length, base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbbaGhor2010';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.5 1.07
1 4.12
2 7.93
3 11.31];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AbbaGhor2010';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
9.302	10.78
9.104	9.08
10.801	15.67
7.458	6.11
10.801	15.06
10.126	13.68
10.066	8.94
10.371	11.90
11.682	20.36
9.636	9.72
9.112	8.67
11.346	20.96
8.472	6.82
9.018	8.80
10.271	13.44
7.549	6.28
9.693	11.74
9.619	10.29
8.347	7.54
8.604	9.41
8.923	8.86
8.908	7.83
8.261	7.66
8.329	8.21
9.175	11.77
8.42	7.01
7.869	6.31
9.086	9.73
7.775	5.49
7.681	4.61
6.794	3.62
7.174	4.01
7.86	5.01
7.286	4.10
6.402	2.96
6.987	3.24
6.027	2.21
6.196	2.23
8.824	8.47
10.171	12.77
10.536	12.55
12.047	24.51
9.284	8.66
10.56	13.35
9.619	10.79
9.783	9.19
9.278	7.65
9.736	10.26
10.224	10.60
8.773	6.15
8.501	5.67
9.115	7.83
9.112	8.97
9.936	12.83
9.523	10.10
9.428	9.11
9.625	10.27
10.179	12.97
9.521	9.20
10.066	9.77
10.012	9.91
10.484	10.38
9.873	10.10
10.291	10.13
9.876	9.81
9.056	9.09
9.878	8.60
9.472	9.00
9.484	7.51
10.701	13.28
10.581	12.03
10.256	11.59
9.866	9.35
9.854	9.86
9.181	8.14
9.297	8.89
8.639	6.88
9.694	10.04
9.608	8.74
9.704	13.32
9.634	14.22
9.714	13.66
10.126	15.93
8.93	11.08
9.592	14.81
10.9	17.28
9.718	12.42
8.908	10.33
10.057	11.83
9.053	10.31
9.086	10.71
10.238	11.27
9.703	8.77
8.94	7.03
10.228	12.87
10.6	13.39
10.291	13.65
10.555	14.53
9.085	7.75
9.701	10.43
8.289	8.95
8.496	8.32
8.097	6.10
8.566	8.36
7.735	6.15
7.496	5.89
7.586	4.45
7.889	5.51
9.542	10.93
9.039	9.89
8.482	8.16
10.126	12.28
11.682	12.20
9.302	11.55
10.237	9.84
9.619	7.15
7.586	6.11
9.039	5.81
8.347	6.54
9.092	7.61
10.033	10.65
8.642	7.10
9.293	7.28
8.44	6.19
8.265	7.07
8.165	6.51
10.66	15.48
9.25	10.03
8.664	8.27
7.856	6.17
7.025	3.45
7.267	4.01
6.611	2.90
7.771	5.18
8.798	8.06
8.307	5.42
9.021	7.44
9.606	10.26
10.237	11.87
8.71	6.95
9.153	9.16
9.344	7.88
8.842	6.37
9.683	10.34
9.825	9.96
8.932	9.14
9.426	12.27
9.671	11.31
10.468	16.45
9.432	8.47
9.163	7.30
8.133	6.60
9.848	11.04
8.28	4.92
8.922	5.89
8.377	5.38
8.649	5.84
9.537	10.09
9.889	11.02
9.391	9.59
8.708	7.24
9.914	8.87
10.302	10.46
9.672	8.82
9.087	6.60
9.516	8.44
9.554	7.44
9.669	8.28
9.218	11.74
8.432	8.61
9.073	8.93
9.362	11.28
9.225	10.42
9.469	10.41
8.588	7.19
8.799	8.16
9.293	9.16
9.306	9.57
9.293	7.51
10.148	10.50];
data.LW(:,1) = data.LW(:,1) * 148/135; % convert fork to total length, based on photo
units.LW = {'d', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'AbbaGhor2010';

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
bibkey = 'AbbaGhor2010'; type = 'phdthesis'; bib = [ ...  
'author = {Abbasi, F. and Ghorbani, R}, ' ...
'year = {2010}, ' ...
'title  = {Study on population dynamics of Spirlin (\emph{Alburnoides eichwaldii}) in TilAbad, Kaboudval and ShirAbbad streams, Golestan Province}, ' ...
'school = {Gorgan university of Agricultural Sciences and Natural Resources, Iran}, ' ...
'pages = {200}'];
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