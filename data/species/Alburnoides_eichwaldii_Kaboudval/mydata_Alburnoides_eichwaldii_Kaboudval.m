  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_eichwaldii_Kaboudval

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_eichwaldii_Kaboudval'; 
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
  temp.ah = C2K(16); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'guess on the basis of Alburnoides_bipunctatus data with ah = 3 ';
data.ab = 10;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess on the basis of Rutilus rutilus, BeekEmme2007';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'AbbaGhor2010';
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'AbbaGhor2010';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'AbbaGhor2010';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'fishbase'; 
data.Lp = 7.99;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'AbbaGhor2010'; 
data.Lpm = 6.95;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'AbbaGhor2010'; 
data.Li = 10.7;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'AbbaGhor2010';

data.Wwb = 3.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'BeekEmme2007';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';

data.Ri = 10800/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'AbbaGhor2010';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.5 5.51
1 6.8
2 7.8
3 9.2];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 148/135; % convert fork to total length, base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbbaGhor2010';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.5 0.98
1 4.17
2 6.06
3 9.80];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AbbaGhor2010';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
8.747	6.89
9.048	10.48
8.734	6.79
7.586	4.57
10.782	19.24
7.665	6.46
9.176	10.46
7.936	5.28
7.616	5.97
7.204	5.97
7.256	4.84
8.227	6.05
5.472	6.56
4.958	1.35
8.339	7.25
8.432	7.11
8.943	9.96
8.133	8.16
9.11	11.95
8.524	9.96
8.271	9.50
8.251	8.78
6.615	4.30
8.975	7.43
8.574	6.33
8.315	7.26
8.196	7.38
7.532	5.24
6.924	0.47
7.881	4.63
5.223	3.18
7.532	4.33
8.495	7.30
7.499	5.28
9.209	9.57
8.975	10.09
8.334	8.72
7.869	5.29
8.025	5.62
7.459	5.25
7.063	4.41
7.48	5.41
7.449	5.27
9.166	9.83
8.582	9.51
8.315	7.12
7.03	5.30
9.163	11.41
7.128	4.77
8.351	7.34
9.359	11.20
8.669	9.87
7.702	6.02
9.242	7.84
10.292	10.21
8.831	7.26
8.605	6.78
8.631	5.89
8.12	5.88
9.088	7.05
9.789	8.74
8.659	6.14
8.574	5.75
8.611	6.33
7.881	3.91
6.996	3.18
11.635	19.90
9.575	10.90
8.068	6.96
8.639	8.52
10.067	14.08
9.886	14.44
9.14	10.87
8.509	10.02
11.393	15.84
9.607	9.01
9.519	9.00
9.995	10.17
7.239	5.52
7.854	6.29
9.72	9.15
9.326	7.58
9.349	8.17
11.151	20.65
9.671	11.54
9.585	11.25
8.714	8.90
8.914	9.14
9.592	13.57
9.56	12.02
9.41	10.56
8.734	8.06
8.654	8.38
9.123	11.96
8.168	8.17
8.159	7.68
9.902	11.90
9.445	9.05
8.822	7.43
10.585	13.70
9.528	9.67
9.635	9.63
8.682	7.25
9.253	8.00
8.446	6.02
7.66	4.43
6.924	4.20
6.437	3.09
7.288	4.45
7.288	3.88
6.923	3.62
8.181	7.12
10.023	11.62
9.735	11.13
7.637	4.75
7.435	5.11
7.673	5.70
8.655	9.07
7.182	3.40
7.883	5.81
7.581	5.60
8.284	5.95
9.522	8.62
8.293	5.32
7.322	3.48
9.346	9.70
9.56	11.93
9.386	11.33
7.328	5.36
8.361	6.64
7.466	5.21
9.118	10.16
9.071	10.69
8.586	7.19
8.564	9.26
7.751	6.83
7.704	5.66
7.247	5.27
6.968	4.21
10.783	9.04
10.026	12.09
10.043	13.15
9.533	10.14
9.167	9.89
9.655	10.93
8.659	7.38
8.658	7.76
8.231	7.11
8.357	7.43
7.306	5.24
9.426	8.74
9.541	8.38
9.476	7.77
8.748	7.04
10.69	13.38
9.15	7.52
8.61	5.92
8.12	7.06
];
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