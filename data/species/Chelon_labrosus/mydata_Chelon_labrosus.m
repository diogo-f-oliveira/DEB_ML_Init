function [data, auxData, metaData, txtData, weights] = mydata_Chelon_labrosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Chelon_labrosus'; 
metaData.species_en = 'Thicklip grey mullet'; 
metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

% for curators only ------------------------------
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 08 25]; 
% -------------------------------------------------

%% set data
% zero-variate data

data.ah = 5;       units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'ZouiKhem2008';   
  temp.ah = C2K(15);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'all temps are guessed form remark: come to coast if temp > 14 C, Leij2006';
data.ab = data.ah + 15; units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'ZouiKhem2008';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2.5*365;    units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'Leij2006';
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '2 till 3 yr';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'Leij2006';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Leij2006: females become older than males';
  
data.Lh  = 0.34;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'ZouiKhem2008';  
data.Lb  = 0.50;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ZouiKhem2008';  
data.Lp  = 25;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Leij2006'; 
data.Li  = 90;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Leij2006';

data.Wwi = 8324;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed as (90/53)^3*1700';
  
data.R53  = 745000/365; units.R53  = '#/d'; label.R53  = 'reprod rate at L = 53 cm'; bibkey.R53  = 'Wiki';   
  temp.R53 = C2K(15);  units.temp.R53 = 'K'; label.temp.R53 = 'temperature';
  comment.R53 = 'reprod rate for L = 53 cm, Ww = 1700 g (Leij2006)';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since hatch (d), total length (cm)
0.889	0.338
2.889	0.373
4.889	0.373
5.889	0.296
8.111	0.408
9.000	0.338
13.889	0.401
20.000	0.704
27.889	1.120
36.000	1.423];
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  bibkey.tL = 'ZouiKhem2008';
temp.tL    = C2K(19.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
% t-W data
data.tW = [ ... % time since hatch (d), wet weight (mg)
0.775	0.839
1.881	1.122
2.876	1.125
3.979	0.711
4.976	1.411
6.190	0.997
8.732	1.006
14.148	1.582
20.121	4.112
28.100	12.502
36.103	29.533];
data.tW(:,2) = 1e-3 * data.tW(:,2); % convert mg to g
units.tW = {'h', 'g'};     label.tW = {'time since hatch', 'wet weight'};  bibkey.tW = 'ZouiKhem2008';
temp.tW = C2K(19.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';

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

%% Links
metaData.links.id_CoL = 'TVBX'; % Cat of Life
metaData.links.id_ITIS = '170371'; % ITIS
metaData.links.id_EoL = '46571482'; % Ency of Life
metaData.links.id_Wiki = 'Chelon_labrosus'; % Wikipedia
metaData.links.id_ADW = 'Chelon_labrosus'; % ADW
metaData.links.id_Taxo = '46293'; % Taxonomicon
metaData.links.id_WoRMS = '126977'; % WoRMS
metaData.links.id_fishbase = 'Chelon-labrosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelon_labrosus}}';
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
bibkey = 'ZouiKhem2008'; type = 'Article'; bib = [ ... 
'author = {D. Zouiten and I. B. Khemis and R. Besbes and C. Cahu}, ' ... 
'year = {2008}, ' ...
'title = {Ontogeny of the digestive tract of thick lipped grey mullet (\emph{Chelon labrosus}) larvae reared in "mesocosms"}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {279}, ' ...
'doi = {10.1016/j}}, ' ...
'pages = {166--172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leij2006'; type = 'Techreport'; bib = [ ... 
'author = {Leijzer, T. B.}, ' ... 
'year = {2006}, ' ...
'title = {Diklipharder \emph{Chelon labrosus} ({R}isso, 1827)}, ' ...
'institution = {Kennisdocumet Sportvisserij Nederland}, ' ...
'number = {17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/12026}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

