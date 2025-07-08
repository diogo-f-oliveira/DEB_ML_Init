function [data, auxData, metaData, txtData, weights] = mydata_Cyprinus_carpio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Cyprinus_carpio'; 
metaData.species_en = 'Common carp'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K. body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L_f'; 't-Ww'; 'L-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'};  

metaData.author_mod_1  = {'Audrey Souloumiac'};                  
metaData.date_mod_1    = [2018 07 18];                      
metaData.email_mod_1   = {'audrey.souloumiac@irsn.fr'};      
metaData.address_mod_1 = {'IRSN'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 19];

%% set data
% zero-variate data
data.ah = 4;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'fishbase'; 
  temp.ah = C2K(18); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 7;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'FAO'; % mod_1
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 390;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'NjouTcho2013'; % mod_1
temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 330;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'NjouTcho2013'; % mod_1
  temp.tpm = C2K(21); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 38*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.5;    units.Lh = 'cm'; label.Lh = 'total length at hatch';            bibkey.Lh = 'WiltEmme2008'; 
data.Lb = 0.7;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'WiltEmme2008'; 
data.Lp = 25.1 ;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'NjouTcho2013'; % mod_1
data.Li = 130;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'Balicubu2006'; % mod_1
  comment.Li = 'Computed as (Wi/0.0245)^(1/2.952). see F1';

data.Wwb = 4.2e-3 + (0.2*4.2e-3);   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'WiltEmme2008';
  comment.Wwb = 'based on egg diameter of 2 mm: 4/3*pi*0.1^3';
data.Wwp = 187.16 + (0.2*187.16) ;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'NjouTcho2013'; % mod_1
data.Wwi = 42611.50373+(0.2*42611.50373);   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Balicubu2006'; % mod_1

data.GSI = 0.3 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';          bibkey.GSI = 'Criv1981'; % mod_1

% univariate data
% time-length
data.tL = [ ... % time since birth (yr). fork length (cm)
0.061	0.332
0.226	6.958
0.305	10.933
0.383	13.031
0.488	13.254
0.853	15.027
1.123	17.129
1.210	21.104
1.315	22.982
1.393	25.081
1.968	26.195
2.073	25.976
2.142	27.081
2.221	30.063
2.299	33.044
2.386	35.033
2.717	35.149
3.135	36.150
3.300	37.478
4.136	38.487
4.389	40.147
5.051	41.153
5.312	42.151
5.983	42.715
6.305	44.156];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 195/185; % convert fork to total length. base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Donk2011';
comment.tL = 'Sorell 2000 cohort';

% Age-Fork length
data.tL_crivelli = [%Age (yr). fork length (mm)
0   0.7
1	173.01169
2	257.7047
3	301.75543
4	349.99332
5	385.63275
6	412.8547
7	428.85544
8	457.47928
9	470.69476
10 478.28418
11 512.5094
12 539.7128];
data.tL_crivelli(:,1) = data.tL_crivelli(:,1) * 365; % convert yr to d
data.tL_crivelli(:,2) = data.tL_crivelli(:,2)/ 10; % convert mm to cm
data.tL_crivelli(:,2) = data.tL_crivelli(:,2) * 195/ 185; % convert fork to total length. based on photo
units.tL_crivelli = {'d', 'cm'}; label.tL_crivelli = {'Age', 'Total length'};  
bibkey.tL_crivelli = 'Criv1981';

% age-wet weight
data.tWw = [%age (yr). Wet weight 
0		22.8   
1		58.3   
2		224.8  
3		440.5 
4		1022.8  
5		1535.0  
6		2677.0  
7		4111.0  
8		4739.0  
9		6585.0  
10		7822.0];
data.tWw (:,1) = data.tWw(:,1)*365; % convert yr to d
units.tWw  = {'d', 'g'}; label.tWw = {'Age', 'Wet weight (g)'};  
bibkey.tWw  = 'Balicubu2006';

% Fork length-Wet weight
data.LWw = [%Fork length (cm). Wet weight (g)
10.0    22.8
13.4	58.3
21.5	224.8
26.9	440.5
37.1	1022.8
43.3	1535.0
51.1	2677.0
58.1	4111.0
61.1	4739.0
69.0    6585.0
69.7	7822.0];
data.LWw(:,1) = data.LWw (:,1) * 195/ 185; % convert fork to total length. base on photo
units.LWw = {'cm', 'g'}; label.LWw = {'Total length', 'Wet weight'};  
bibkey.LWw = 'Balicubu2006';

% Length-Fecondity
data.LN = [%Fork length (cm). Fecundity (#)
23.113367	25000
24.230118	38125
25.143824	25625
25.313028	26250
26.362099	27500
26.83587	65000
28.494078	58750
28.56176	27500
29.035534	58750
30.592216	52500
33.062607	75625
33.57022	53750
34.179356	47500
34.111675	88750
34.2132	    108750
34.450085	83750
34.65313	50625
34.58545	89375];
data.LN(:,1) = data.LN(:,1) * 195/ 185; % convert fork to total length. base on photo
units.LN = {'cm', '#'}; label.LN = {'Total length', 'Fecundity'};  
bibkey.LN= 'KaraSeze2005';

% Wet weight-Fecondity
data.WwN = [%Total wet weight (g). fecundity (#)
221.01695	22383.42
234.57628	25492.229
246.77966	25492.229
250.84746	36062.176
263.05084	38549.223
271.18643	27357.514
317.28815	28601.037
340.339	    51606.22
352.54236	52849.742
357.9661	48497.41
357.9661	46010.363
383.72882	63419.688
391.8644	56580.312
405.42374	57823.836
480.0	    74611.4
520.678	    80829.016
534.2373	78963.734
555.9322	87046.63
650.8475	82694.3
668.47455	85803.11
699.661	    85181.34
695.5932	108808.29];
units.WwN = {'g', '#'}; label.WwN = {'Total wet weight', 'Fecundity'};  
bibkey.WwN= 'KaraSeze2005';

%% set weights for all real data
weights = setweights(data,[]);

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
D2 = 'The high maintenance. compared to other family members. is probably linked to farming selection. to boost production';
D3 = 'mod_1: new uni-variate data is added and some of the zero-variate data is revised- see comments in the mydata file';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.01*(TL in cm)^3.129';
metaData.bibkey.F1 = 'WiltEmme2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33HRJ'; % Cat of Life
metaData.links.id_ITIS = '163344'; % ITIS
metaData.links.id_EoL = '46581741'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinus_carpio'; % Wikipedia
metaData.links.id_ADW = 'Cyprinus_carpio'; % ADW
metaData.links.id_Taxo = '43900'; % Taxonomicon
metaData.links.id_WoRMS = '154582'; % WoRMS
metaData.links.id_fishbase = 'Cyprinus-carpio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyprinus_carpio}}';  
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press. Cambridge}, ' ...
'pages = {Table 4.2 (page 150). 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiltEmme2008'; type = 'techreport'; bib = [ ...  
'author = {R. S. de Wilt and W. A. M. van Emmerik}, ' ...
'year = {2008}, ' ...
'title = {Kennisdocument karper. \emph{Cyprinus carpio} (Linnaeus 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'volume = {22}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-karper_4552.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1450}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Balicubu2006'; type = 'techreport'; bib = [ ...  
'author = {I. Bal{\i}k, H. and \c{C}ubuk, R. and \"{O}zk\"{o}k and R. Uysal}, ' ...
'year = {2006}, ' ...
'title = {Some Characteristics and Size of Carp (\emph{Cyprinus carpio} L. 1758) Population in the Lake Karamik (Afyonkarahisar/Turkey)}, ' ...  
'institution = {Mediterranean Fisheries Research. Antalya. Turkey}, ' ...
'volume = {6}, ' ...
'howpublished = {\url{http://www.trjfas.org/uploads/pdf_296.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/affris/species-profiles/common-carp/common-carp-home/en/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Donk2011'; type = 'techreport'; bib = [ ...  
'author = {P. Donkers}, ' ...
'year = {2011}, ' ...
'title = {Age, growth and Maturity of the common carp (\emph{Cyprinus carpio}) in lake Crescent and Sorell}, ' ... 
'institution = {Inland Fisheries Service, Tasmania, Australia}, ' ...
'volume = {4}, ' ...
'howpublished = {\url{https://www.ifs.tas.gov.au/about-us/publications/age-growth-and-maturity-of-the-common-carp-cyprinus-carpio-in-lake-crescent-and-sorell}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Criv1981'; type = 'techreport'; bib = [ ...
'author = {A. J. Crivelli}, ' ...
'year = {1981}, ' ...
'title = {The biology of the common carp \emph{Cyprinus carpio} L in the Camargue, southern France}, ' ...
'institution = {Station biologic de la Tour du Valat, Arles, France}, ' ...
'volume = {18}, ' ...
'howpublished = {\url{https://onlinelibrary.wiley.com/doi/full/10.1111/j.1095-8649.1981.tb03769.x}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KaraSeze2005'; type = 'techreport'; bib = [ ...
'author = {M. Karatas and M. Seze}, ' ...
'year = {2005}, ' ...
'title = {Reproduction characteristics of populations of Carp inhabiting in Almus Dam Lake, Turkey}, ' ...
'institution = {fao}, ' ...
'howpublished = {\url{http://agris.fao.org/agris-search/search.do?recordID=AV20120133922}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NjouTcho2013'; type = 'techreport'; bib = [ ...
'author = {Njouokou, S. and Tchoumboue, J. and Nguenga, D. and Pouomogne, V. and Gaillard, J. and Sulem, S. and Bidzanga, N.}, ' ...
'year = {2013}, ' ...
'title = {D\''{e}termination des caract\''{e}ristiques de maturit\''{e} sexuelle du \emph{Cyprinus carpio} en zone d''altitude Camerounaise}, ' ...
'institution = {Institut de recherche Agricole pour de D\''{e}veloppement (IRAD), Foumban, Cameroun}, ' ...
'volume = {7}, ' ...
'howpublished = {\url{http://ajol.info/index.php/ijbcs}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

