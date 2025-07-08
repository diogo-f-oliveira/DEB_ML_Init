function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_vulgaris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_vulgaris'; 
metaData.species_en = 'Common two-banded sea bream'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 



%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 45;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 1500;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 536e3/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Diplodus sargus';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
0.069	1.008
0.156	1.100
0.223	1.828
0.406	2.557
0.483	3.558
0.579	4.196
0.737	10.744
0.738	9.835
0.745	11.744
0.746	11.289
0.764	12.562
0.814	11.199
0.815	10.563
0.820	14.290
0.821	13.836
0.821	13.472
0.822	13.017
0.823	12.199
0.825	10.199
0.880	13.200
0.890	12.382
0.892	10.927
0.893	10.200
0.896	16.382
0.898	14.382
0.898	13.837
0.899	13.291
0.901	11.746
0.904	8.746
0.966	14.383
0.971	18.838
0.972	17.292
0.973	16.383
0.983	15.838
0.984	15.383
1.226	16.023
1.247	13.932
1.248	13.387
1.313	16.206
1.313	15.660
1.314	14.933
1.321	17.115
1.736	18.938
1.884	17.031
1.889	20.940
1.890	20.759
1.890	19.940
1.891	19.395
1.891	19.031
1.892	18.668
1.892	18.213
1.894	16.486
1.895	16.122
1.895	15.759
1.895	15.395
1.902	17.850
1.940	19.032
1.959	19.578
1.961	17.850
1.961	17.396
1.977	20.578
1.978	20.032
1.979	18.396
1.983	15.214
2.017	19.124
2.036	20.033
2.055	20.397
2.057	18.124
2.210	20.035
2.211	18.945
2.218	22.036
2.232	18.127
2.896	22.772
2.896	22.226
2.897	21.681
2.897	21.135
2.898	20.681
2.909	19.681
2.982	23.500
2.983	22.955
2.983	22.318
2.985	21.227
2.985	20.864
2.985	20.500
2.986	19.955
3.060	23.410
3.060	22.956
3.214	24.048
3.216	22.321
3.217	21.776
3.218	20.412
3.219	20.049
3.236	21.412
3.247	20.867
3.370	23.051
3.835	24.057
3.904	23.148
3.912	24.058
3.970	24.786
3.970	24.149
4.224	23.062
4.241	24.698
4.242	24.062
4.243	23.425
4.383	27.700
4.394	27.337
4.395	26.064
4.819	28.524
4.878	27.706
5.229	25.529
5.230	24.893
5.238	26.529
5.381	28.440];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli1997';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6CY2M'; % Cat of Life
metaData.links.id_ITIS = '182919'; % ITIS
metaData.links.id_EoL = '46579947'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_vulgaris'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_vulgaris'; % ADW
metaData.links.id_Taxo = '173241'; % Taxonomicon
metaData.links.id_WoRMS = '127054'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-vulgaris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus_vulgaris}}';
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
bibkey = 'GordMoli1997'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i}}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the sparids \emph{Diplodus vulgaris}, \emph{D. sargus} and \emph{D. annularis} in adult populations and the differences in their juvenile growth patterns in the north-western {M}editerranean {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {33}, ' ...
'pages = {123-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Diplodus-vulgaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
