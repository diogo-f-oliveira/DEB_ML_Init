function [data, auxData, metaData, txtData, weights] = mydata_Noturus_flavus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_flavus'; 
metaData.species_en = 'Stonecat'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 11 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 11 14]; 

%% set data
% zero-variate data;

data.am = 7*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 8;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'Based on value for Noturus phaeus';
data.Li  = 31;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 1.4e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 3 mm as typical for Noturus: pi/6*0.3^3';
data.Wwi = 325; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00724*Li^3.12, see F1';
   
data.Ri = 306/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.653	4.690
0.663	5.345
0.695	6.034
0.855	7.759
0.864	9.000
0.865	8.897
0.865	8.793
0.865	8.724
0.873	11.069
0.873	10.897
0.876	8.586
0.877	7.552
0.878	6.586
0.888	7.448
0.891	4.690
0.893	12.828
0.893	12.448
0.893	12.207
0.894	12.000
0.894	11.172
0.895	10.621
0.895	10.241
0.896	10.069
0.896	9.862
0.896	9.759
0.896	9.586
0.896	9.448
0.900	6.207
0.900	6.069
0.900	5.931
0.902	4.448
0.903	13.345
0.905	11.276
0.909	7.241
0.910	7.172
0.910	6.966
0.915	11.690
0.916	11.448
0.919	8.483
0.922	5.828
0.922	5.655
0.922	5.517
0.922	5.345
0.922	5.276
0.923	5.034
0.923	4.966
0.924	13.862
1.421	13.000
1.440	15.414
1.453	13.655
1.453	13.517
1.454	12.379
1.455	12.103
1.886	12.517
1.888	10.793
1.889	9.931
1.896	13.379
1.905	14.828
1.905	14.828
1.911	9.172
1.911	9.000
1.911	9.000
1.911	8.759
1.912	8.000
1.917	13.931
1.917	13.931
1.917	13.931
1.917	13.690
1.929	12.897
1.930	11.586
1.931	11.103
1.992	14.483
1.992	14.483
2.002	15.207
2.004	12.862
2.367	16.931
2.422	16.103
2.422	16.103
2.422	16.103
2.443	15.828
2.446	13.552
2.446	13.552
2.474	17.379
2.889	12.724
2.982	16.897
2.982	16.828
2.983	15.897
3.007	13.517
3.016	15.345
3.027	15.379
3.414	16.552
3.414	16.552
3.414	16.483
3.414	16.172
3.424	17.276
3.426	14.966
3.427	14.759
3.428	13.690
3.428	13.552
3.434	17.621
3.435	17.172
3.436	15.931
3.437	15.483
3.437	15.069
3.467	17.000
3.902	14.000
3.927	11.448
3.976	15.207
3.977	15.034
3.985	17.172
3.985	17.000
3.997	16.034
4.428	16.862
4.429	15.862
4.449	17.103
4.976	19.276
5.453	16.483];
data.tL(:,1) = (-0.2 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PucaDParr2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from fenales';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00724  *(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZMP'; % Cat of Life
metaData.links.id_ITIS = '164013'; % ITIS
metaData.links.id_EoL = '208018'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_flavus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_flavus'; % ADW
metaData.links.id_Taxo = '181568'; % Taxonomicon
metaData.links.id_WoRMS = '723266'; % WoRMS
metaData.links.id_fishbase = 'Noturus-flavus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_flavus}}';
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
bibkey = 'PucaDParr2018'; type = 'article'; bib = [ ...  
'author = {Elizabeth A. Puchala and Donna L. Parrish and Derek H. Ogle}, ' ...
'year = {2018}, ' ...
'title = {Size and Age of Stonecats in {L}ake {C}hamplain; Estimating Growth at the Margin of their Range to Aid in Population Management}, ' ... 
'journal = {North American Journal of Fisheries Management}, '...
'volume = {38}, ' ...
'pages = {1316-1323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-flavus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

