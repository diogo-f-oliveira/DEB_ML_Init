function [data, auxData, metaData, txtData, weights] = mydata_Excirolana_armata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Cirolanidae';
metaData.species    = 'Excirolana_armata'; 
metaData.species_en = 'Cirolanid Isopod'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Tan Tjui Yeuw', 'Samantha Abreu Alves dos Santos', 'Fabio Stucchi Vannucchi'};    
metaData.date_subm = [2021 06 07];              
metaData.email    = {'tan.tjui-yeuw@unesp.br'};            
metaData.address  = {'Sao Paulo State University (UNESP)'};  

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2021 06 18]; 

%% set data
% zero-variate data

data.ab = 40;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'PetrCard2010';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'longer than 1 month, till two months';
data.am = 1.93*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'PetrCard2010';  
   temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.12;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'PetrCard2010'; 
    comment.Lb = 'Smallest juvenile';
data.Lp  = 0.24;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'PetrCard2010';
    comment.Lp = 'based on LN data';
data.Li  = 1.2;  units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'ThomSanc2007';
    comment.Li = 'Largest female';
     
data.Wdi = 0.079;  units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';        bibkey.Wdi = 'PetrCard2010';
  comment.Wdi = 'based on 10^(-4.074 + 2.458 * log10(10*Li)), see F1';
  
data.Ri = 39*5/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';     bibkey.Ri = 'LozoDefe2006';  
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guessed 5 times a year, data for Uruguay'; % is it for uruguay?

% uni-variate data
% t-L data Fig 5 of PetrCard2010:
data.tL_br = [ ... % time since birth (years), body length (mm)
0.092,1.228
0.12,1.576
0.139,1.95
0.199,2.377
0.215,3.178
0.225,2.964
0.244,3.472
0.263,3.632
0.278,3.819
0.285,4.033
0.294,4.54
0.321,4.674
0.328,4.139
0.344,4.62
0.352,4.7
0.368,4.861
0.383,4.647
0.4,5.208
0.404,5.101
0.416,4.78
0.464,5.555
0.478,5.501
0.488,5.234
0.5,4.754
0.541,5.715
0.557,5.528
0.589,5.822
0.646,5.688
0.656,6.009
0.725,6.062
0.732,6.383
0.797,6.249
0.856,6.223
0.885,6.783
1.043,7.691
1.227,7.264
1.31,7.691
 ];
data.tL_br(:,1) = data.tL_br(:,1)*365; % convert year to day
data.tL_br(:,2) = data.tL_br(:,2)/10; % convert mm to cm
units.tL_br  = {'d', 'cm'};  label.tL_br = {'time', 'body length'};  
temp.tL_br   = C2K(23);  units.temp.tL_br = 'K'; label.temp.tL_br = 'temperature';
bibkey.tL_br = {'PetrCard2010'};
comment.tL_br = 'Adult, extracted from a plot (Fig 5) manually';
 
 % length - clutch size
    % Brazil
data.LN_br = [ ... % body length (mm), n of embryos (#)
2.39	2.44	2.5	2.6	2.71	2.77	2.81	2.87	2.9	2.94	3	3.1	3.19	3.31	3.35	3.4	3.44	3.5	3.6	3.71	3.75	3.81	3.9	4	4.04	4.12	4.15	4.19	4.29	4.33	4.38	4.44	4.56	4.6	4.65	4.71	4.75	4.81	4.88	5.04	5.08	5.12	5.21	5.25	5.31	5.38	5.5	5.54	5.63	5.71	5.81	5.88	5.96	6.04	6.13	6.17	6.19	6.25	6.33	6.42	6.46	6.5	6.56	6.6	6.92	6.98	7.05
8.19	7.33	5.09	3.88	5.69	8.19	1.72	5.43	6.98	9.22	5.95	7.07	8.79	8.1	10	4.22	6.81	4.91	9.22	11.21	8.02	9.05	10.17	6.21	7.16	11.21	8.97	10.17	5.95	9.14	12.33	11.12	8.88	7.07	11.98	10	13.02	8.88	7.93	12.33	13.1	11.21	10	8.28	11.21	13.28	12.16	14.22	11.12	13.19	14.22	12.24	15.86	12.84	11.98	14.31	16.12	13.02	11.64	14.57	15.86	13.36	12.5	16.81	15.17	17.67	15.78
]';
data.LN_br(:,1) = data.LN_br(:,1)/10; % convert mm to cm
units.LN_br   = {'cm', '#'};  label.LN_br = {'body length', 'embryos'};  
temp.LN_br   = C2K(23);  units.temp.LN_br = 'K'; label.temp.LN_br = 'temperature';
bibkey.LN_br = {'PetrCard2010'};
comment.LN_br = 'Brazil, extracted from a plot manually';


    % Uruguai
data.LN_ur = [ ... % body length (mm), n of embryos (#)
2.7	3.8	3.2	3.4	3.6	3.8	3.9	4.1	4.2	4.1	4.2	4.4	4.5	4.9	4.1	3.9	3.7	3.9	3.8	4	4.1	4.3	4.1	3.9	4.1	4	4.2	4.4	4.4	4.4	4.3	4.4	4.4	4.6	4.7	4.7	4.8	4.8	5.2	5.3	5.9	5.2	5.4	5.4	5.6	5.2	5	4.8	4.7	4.7	4.9	5	4.7	4.8	4.8	4.7	4.7	5	5.3	5.3	5.3	5.4	5.4	5.6	5.8	5.6	5.9	6.2	6.3	6	6.2	5.9	5.9	5.7	5.7	5.5	5.5	5.6	5.1	5.3	5.1	5.4	5.4	5.6	5.6	5.6	5.7	5.9	5.7	5.8	6	6.3	6.5	6.6	6.5	6.8	6.8	6.2	6.1	6.1	5.9	5.8	6	6	5.8	5.8	5.9	5.7	7.2	7.4	6.9	7.1	7.4	7.7	7	6.9	6.8	6.9	7.4	7.4	7.3	7.2	7.1	6.9	6.7	6.5	6.3	6.3	6.2	6.5	6.6	6.1	6.1	6.3	6.2	6.3	6.5	6.6	6.8	6.9	7	6.8	6.9	7	7.4	7.5	7.8	8.2	7	6.7	6.6	6.4	6.6	6.6	6.8	6.8	6.6	6.4	6.3	6.2	6.6	6.8	6.9	7.3	7.3	7.5	7.7	7.9	8.1	8.4	7.9	8.8	9.2	8	7.7	7.5	7.3	7.2	7.4	7.6	7.8	7.6	7.3	7.4	7.2	8	8.3	8.6	8.9	8.6	8.3	8.4	8	8	8	7.8	7.7	7.4	7.7	7.8	7.1	7.3	6.9	7.1	7.1	10.2	8.1	8.1	8.3	8.4	8.9	8.8	9.1	9.3	9.6	9.2	9	8.8	8.7	8.3	8.2	8.1	8	7.7	8.2	7.8	9.6	9.5	9.6	9	9.1	9	8.7	8.7	8.6	8.4	8.2	7.7	8.8	9	9.2	9.6	9.6	10.2	10.2	11.5
5.1	2	11	10.9	6.1	6	6.1	6.2	6.1	5.4	3.9	4.9	5.8	5	6.8	7.8	8.9	8.6	10	11.2	12	11.8	10	9.2	9.1	8.1	8.1	8	8.9	10	15.5	13.9	12	11.8	10.3	8.3	7.3	9.1	6.9	5.9	3.2	7.9	7.9	9	9	11	11.9	12.1	12	13.1	13.2	13.1	15.1	14.9	16.2	16	17.1	14.9	13.9	15.1	12	12.1	11	10.8	9.7	11.9	12	11	12.1	13	13.1	12.9	14.3	14	13	13	13.8	15	16.8	17.9	19.7	20.1	19	18.9	18.2	17	17	16.8	16.1	15.2	15.1	16.3	16.1	16	15.2	14	8.2	16.8	18.3	18	18.2	19.3	18.9	19.9	20	21	21	23.1	12.9	12.9	14.9	15.1	15.3	14.8	15.9	16.9	16.9	18	17	18	18	19.1	19	19	19	18	18.9	20	19.9	19.7	19.8	22	21.9	21.8	21	21.1	21	20.9	21.4	21	21	19.6	19.9	19.9	19.6	21.1	19.7	18.1	22.5	21.8	22	22.9	22.8	23.9	23.9	24.9	24.9	25.2	26.2	28.1	27.1	26.9	23.1	21.2	21.9	22.2	22	22.1	22	22.2	20.9	21.4	21.2	23.2	22.8	22.9	23.1	24.1	24	24	25	24.6	24.7	25.7	26	25.3	24.8	24.1	24.1	25.7	26.9	26	26.9	26	27	27	27	27	25.9	25.9	27.9	28.6	28.8	30.7	32.2	25.4	27.8	29.2	29.1	29.1	29.1	28.2	27.9	27.9	29.2	29.1	29	30.5	30.2	30.2	30.9	31.9	32	31.7	33.2	34.1	29.1	30.9	31.9	33	34.1	34.2	32.6	33.7	34.8	36.2	37.9	37	39.1	36.8	35.9	37.8	38.7	35.3	33.9	38.1
]';
data.LN_ur(:,1) = data.LN_ur(:,1)/10; % convert mm to cm
units.LN_ur   = {'cm', '#'};  label.LN_ur = {'body length', 'embryos'};  
temp.LN_ur   = C2K(17);  units.temp.LN_ur = 'K'; label.temp.LN_ur = 'temperature';
bibkey.LN_ur = {'LozoDefe2006'};
comment.LN_ur = 'Uruguay';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_br = 3 * weights.tL_br;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for ouaput
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to have the same parameters as females';     
D2 = 'Data mostly for Brazil and Uruguay, Uruguay assumed to have a lower food abundance';
D3 = 'tL_br data modeled with a sinusoid temp fluctuation';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'length-AFDW: AFDW in g 10^(-4.074 + 2.458 * log10(length in mm))';
metaData.bibkey.F1 = 'PetrCard2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3DJX4'; % Cat of Life
metaData.links.id_ITIS = '544403'; % ITIS
metaData.links.id_EoL = '344559'; % Ency of Life
metaData.links.id_Wiki = 'Excirolana'; % Wikipedia
metaData.links.id_ADW = 'Excirolana_armata'; % ADW
metaData.links.id_Taxo = '381137'; % Taxonomicon
metaData.links.id_WoRMS = '258412'; % WoRMS


%% References
bibkey = 'PetrCard2010'; type = 'Article'; bib = [ ...  
'author = {Marcelo Petracco and Ricardo S. Cardoso and Thais N. Corbisier}, ' ...
'year = {2010}, ' ...
'title  = {Population biology of \emph{Excirolana armata} ({D}ana, 1853)({I}sopoda, {C}irolanidae) on an exposed sandy beach in {S}outheastern {B}razil}, ' ...
'journal = {Marine Ecology}, ' ...
'pages = {330-340}, ' ...
'volume = {31}, ' ...
'howpublished = {\url{htaps://onlinelibrary.wiley.com/doi/full/10.1111/j.1439-0485.2009.00341.x?}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomSanc2007'; type = 'Article'; bib = [ ...  
'author = {G. A. Thompson and M. Sanchez de Bock}, ' ...
'year = {2007}, ' ...
'title  = {Population dynamics of \emph{Excirolana armata} ({I}sopoda: {C}irolanidae) in {B}uenos {A}ires beaches, {A}rgentina}, ' ...
'journal = {Revista de Biologia Tropical}, ' ...
'pages = {131-140}, ' ...
'volume = {55}, ' ...
'howpublished = {\url{htaps://revistas.ucr.ac.cr/index.php/rbt/article/view/5813}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LozoDefe2006'; type = 'Article'; bib = [ ...  
'author = {Juan Pablo Lozoya and Omar Defeo}, ' ...
'year = {2006}, ' ...
'title  = {Effects of a freshwater canal discharge on an ovoviviparous isopod inhabiting an exposed sandy beach}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'pages = {421-428}, ' ...
'volume = {57}, ' ...
'howpublished = {\url{https://www.publish.csiro.au/mf/mf05067}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{htap://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
