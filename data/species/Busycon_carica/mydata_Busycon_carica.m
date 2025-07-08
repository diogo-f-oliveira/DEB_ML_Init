function [data, auxData, metaData, txtData, weights] = mydata_Busycon_carica
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Buccinidae';
metaData.species    = 'Busycon_carica'; 
metaData.species_en = 'Knobbed whelk'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 90*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'EverAnde2008';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'PoweSwee2016';
data.Lp  = 10; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'sealifebase';
data.Li  = 24.9;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'sealifebase';

data.Wwi = 100*40*2/365;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on 0.1503*Li^2.805, see F1';

data.Ri  = 1033/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'PoweSwee2016';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '40-160 egg capsules, each with 30-50 embryos, twice per yr';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
3.659	3.514
4.146	3.768
4.756	4.239
4.878	3.913
5.610	3.587
6.707	5.616
10.488	9.022
11.098	9.022
11.585	8.623
12.195	10.145
12.439	8.841
12.683	8.949
12.805	11.377
12.927	8.478
12.927	8.333
13.293	9.203
13.780	9.420
13.902	12.572
14.146	10.978
14.390	9.601
14.512	8.333
15.000	9.819
15.366	10.507
15.366	8.623
15.488	9.601
15.610	10.181
16.341	10.290
17.073	10.507
17.195	11.014
17.561	11.341
17.561	11.594
18.049	10.145
18.537	12.862
18.537	10.580
18.537	11.087
18.902	10.688
19.024	11.594
19.268	13.370
19.634	11.268
19.878	11.703
19.878	10.942
20.000	10.471
20.122	12.319
20.488	11.232
20.976	11.848
21.341	12.246
21.341	11.993
21.341	11.449
21.829	11.630
22.073	10.833
22.683	14.601
22.805	12.065
22.927	12.428
23.537	11.449
24.024	12.428
24.268	12.065
24.756	14.275
24.878	12.754
24.878	13.007
25.610	12.754
26.098	12.899
26.098	13.152
26.829	12.572
27.317	13.370
27.805	13.442
28.049	13.188
28.171	13.007
28.902	13.478
29.146	13.225
30.000	13.587
30.244	13.333
30.366	13.986
30.854	13.551
31.341	13.659
32.195	13.768
33.049	13.768
35.000	14.312
35.488	14.022
35.854	14.891
36.098	14.203
37.317	14.312
38.293	14.312
38.659	14.457
41.463	14.529
42.195	14.891
42.195	14.601
46.220	15.616
46.341	16.196
47.927	14.891
51.098	14.928
55.610	15.072
55.976	15.362
67.073	15.254
84.512	15.399
88.049	15.290];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EverAnde2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-';  label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: SFWM in g = 0.1503*(SL in cm)^2.805';
metaData.bibkey.F1 = 'sealifebase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NYSD'; % Cat of Life
metaData.links.id_ITIS = '74071'; % ITIS
metaData.links.id_EoL = '46463539'; % Ency of Life
metaData.links.id_Wiki = 'Busycon_carica'; % Wikipedia
metaData.links.id_ADW = 'Busycon_carica'; % ADW
metaData.links.id_Taxo = '114580'; % Taxonomicon
metaData.links.id_WoRMS = '160185'; % WoRMS
metaData.links.id_molluscabase = '160185'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Busycon_carica}}';
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
bibkey = 'EverAnde2008'; type = 'Article'; bib = [ ... 
'doi = {10.2983/0730-8000(2008)27[423:AAGOTK]2.0.CO;2}, ' ...
'author = {Arnold G. Eversole and William D. Anderson and J. Jeffery Isely}, ' ... 
'year = {2008}, ' ...
'title = {AGE AND GROWTH OF THE KNOBBED WHELK \emph{Busycon_carica} ({G}MELIN 1791) IN {S}OUTH {C}AROLINA SUBTIDAL WATERS}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {27(2)}, ' ...
'pages = {423-426}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Busycon-carica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoweSwee2016'; type = 'techreport'; bib = [ ... 
'doi = {10.2983/0730-8000(2008)27[423:AAGOTK]2.0.CO;2}, ' ...
'author = {Alan J. Power and Mary Sweeney-Reeves and Todd Recicar and Marcy Mitchel and Randal L. Walker}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive Patterns of the Knobbed Whelk, \emph{Busycon carica} (Gmelin 1791) in the Southeastern United States}, ' ...
'institution = {University of Georgia Marine Extension Service}, ' ...
'series = {Occasional Papers of the University of Georgia Marine Extension Service}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
